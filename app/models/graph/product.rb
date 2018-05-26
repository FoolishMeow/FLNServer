class Graph::Product
  include Neo4jExtends

  TYPES = %w[Production Service System Solution Platform Tools].freeze

  property :name, type: String
  property :desc, type: String
  property :ext_relationships
  property :types

  serialize :ext_relationships

  validates :types, presence: true

  has_many :both, :related_products, type: :often_viewed_with, model_class: '::Graph::Product'
  has_many :out,  :use_cases,        type: :has_use_case
  has_many :out,  :examples,         type: :has_example
  has_many :out,  :abbreviations,    type: :has_abbrs
  has_many :in,   :technologies,     origin: :products
  has_many :in,   :institutions,     origin: :products

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end
end
