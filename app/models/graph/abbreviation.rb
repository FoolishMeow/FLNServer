class Graph::Abbreviation
  include Neo4j::ActiveNode

  property :name, type: String
  validates_uniqueness_of :name, case_sensitive: false

  has_many :in, :technologies, origin: :abbreviations
  has_many :in, :experts,      origin: :abbreviations
  has_many :in, :institutions, origin: :abbreviations
  has_many :in, :products,     origin: :abbreviations
end
