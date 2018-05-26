class Graph::Resource
  include Neo4jExtends

  TYPES = %w[Data Tools Tutorial Course].freeze

  property :name, type: String
  property :desc, type: String
  property :ext_relationships
  property :types

  serialize :ext_relationships

  validates :name, presence: true

  has_many :both, :related_resources, type: :often_viewed_with, model_class: '::Graph::Resource'
  has_many :in,   :technologies,      origin: :resources
  has_many :in,   :papers,            origin: :resources

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end
end
