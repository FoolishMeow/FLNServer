class Graph::Paper
  include Neo4jExtends

  TYPES = %w[Classic Summarize Influence Other].freeze

  property :name, type: String
  property :desc, type: String
  property :ext_relationships
  property :types

  serialize :ext_relationships

  validates :name, presence: true
  validates :types, presence: true

  has_many :both, :related_papers, type: :often_viewed_with, model_class: '::Graph::Paper'
  has_many :out,  :authors,        type: :author,            model_class: '::Graph::Expert'
  has_many :out,  :resources,      type: :is_about
  has_many :in,   :technologies,   origin: :papers
  has_many :in,   :publications,   origin: :papers

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end
end
