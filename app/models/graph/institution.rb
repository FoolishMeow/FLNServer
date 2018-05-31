class Graph::Institution
  include Neo4jExtends

  TYPES = %w[Company Research Other].freeze

  property :zh_name,             type: String
  property :en_name,             type: String
  property :desc,                type: String
  property :summary,             type: String
  property :image,               type: String
  property :website,             type: String
  property :summary_sources
  property :ext_relationships
  property :types

  #mount_uploader :image, ImageUploader

  serialize :ext_relationships
  serialize :summary_sources

  enum level: %i[level_1 level_2 level_3], _default: :level_1

  validates :en_name, presence: true
  validates :types,   presence: true

  has_many :both, :related_institutions, type: :often_viewed_with, model_class: '::Graph::Institution'
  has_many :out,  :technologies,         type: :has_technology
  has_many :out,  :products,             type: :has_product
  has_many :out,  :papers,               type: :has_paper
  has_many :out,  :use_cases,            type: :has_use_case
  has_many :out,  :abbreviations,        type: :has_abbrs
  has_many :in,   :experts,              origin: :institutions

  def full_name
    zh_name || en_name
  end

  def update_tags(*tags)
    super(*tags) { |t| t & TYPES }
  end
end
