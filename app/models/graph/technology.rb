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
end
