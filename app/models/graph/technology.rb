class Graph::Technology
  include Neo4jExtends

  TYPES = %w[Model Algorithm Strategy Method Application Mission Theory Element Other].freeze

  property :zh_name,          type: String
  property :en_name,          type: String
  property :desc,             type: String
  property :summary,          type: String
  property :summary_sources
  property :types

  enum level: %i[level_1 level_2 level_3], _default: :level_1

  serialize :summary_sources

  validates :zh_name, presence: true
  validates :en_name, presence: true
  validates :types,   presence: true

  has_many :both, :related_technologies, type: :often_viewed_with, model_class: '::Graph::Technology'
  has_many :in,  :institutions,  origin: :technologies
  has_many :in,  :experts,       origin: :technologies
  has_many :in,  :publications,  origin: :technologies
  has_many :out, :papers,        type: :has_paper
  has_many :out, :products,      type: :apply_to
  has_many :out, :use_cases,     type: :has_use_case
  has_many :out, :resources,     type: :has_resource
  has_many :out, :abbreviations, type: :has_abbrs

  def full_name
    zh_name || en_name
  end

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end

  def klass
     case self.types.first
       when "Element"
         :fact
       when "Model", "Theory"
         :concept
       when "Algorithm", "Application", "Method"
         :program
       when "Strategy", "Mission", "Other"
         :meta
       else
         :meta
     end
  end

  def to_node
    {
      id: self.id,
      zh_name: self.zh_name,
      en_name: self.en_name,
      label: self.zh_name,
      type: I18n.t("klass.#{self.klass}"),
      summary: self.summary
    }
  end

  class << self
    def search(param)
      Graph::Technology.query_as(:n).where("n.en_name =~ '(?i).*#{param.gsub('', '.*')}.*'").pluck(:n)
          .sort {|a, b| b.related_technologies.length - a.related_technologies.length}.first(5).map &:zh_name
    end

    def all_with_relationships(size = 0)
      @relationships = ::Graph::Technology.query_as(:n)
                           .match("(n)-[:often_viewed_with]-(related_technologies)")
                           .return("{ source: n, target: related_technologies}")
                           .response.map {|r| r["{ source: n, target: related_technologies}"]}
      @nodes = []
      @relationships = @relationships.first(size) unless size == 0
      @relationships.each {|r| @nodes << r[:source] << r[:target]}
      puts @relationships.size
      @nodes.uniq!
      @returning = {nodes: [], edges: []}
      @nodes.each do |node|
        @returning[:nodes] << node.to_node
      end

      @relationships.each do |rel|
        @returning[:edges] << {source: rel[:source].id, target: rel[:target].id}
      end

      @returning[:edges].delete_if {|e| e[:source] == e[:target]}
      puts "filtered: #{@returning[:edges].size}"
      return @returning
    end
  end
end
