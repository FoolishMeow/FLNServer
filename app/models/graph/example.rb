class Graph::Example
  include Neo4j::ActiveNode
  include Neo4j::Timestamps::Updated

  has_many :in, :products, origin: :examples
  has_many :in, :use_case, origin: :examples
end
