class Graph::UseCase
  include Neo4j::ActiveNode
  include Neo4j::Timestamps::Updated

  property :name, type: String
  property :description, type: String

  validates :name, presence: true

  has_many :out, :examples,     type: :has_example
  has_many :in,  :technologies, origin: :use_cases
  has_many :in,  :products,     origin: :use_cases
  has_many :in,  :institutions, origin: :use_cases
end
