class Graph::Publication
  include Neo4jExtends

  TYPES = %w[Conference Magazine Other].freeze

  property :name, type: String
  property :desc, type: String
  property :ext_relationships
  property :types

  serialize :ext_relationships

  validates :name, presence: true

  has_many :out, :papers,       type: :has_paper
  has_many :out, :technologies, type: :has_technology
  has_many :in,  :experts,      origin: :publications

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end
end
