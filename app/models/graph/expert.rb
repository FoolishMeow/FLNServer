class Graph::Expert
  include Neo4jExtends

  property :zh_name,            type: String
  property :en_name,            type: String
  property :desc,               type: String
  property :summary,            type: String
  property :image,              type: String
  property :summary_sources
  property :ext_relationships

  mount_uploader :image, ImageUploader

  enum level: %i[level_1 level_2 level_3], _default: :level_1

  serialize :ext_relationships
  serialize :summary_sources

  validates :en_name, presence: true

  has_many :both, :related_experts, type: :often_viewed_with, model_class: '::Graph::Expert'
  has_many :out,  :technologies,    type: :expert_in_technology
  has_many :out,  :institutions,    type: :belongs_to
  has_many :out,  :publications,    type: :participate_in
  has_many :out,  :abbreviations,   type: :has_abbrs
  has_many :in,   :papers,          origin: :authors

  def full_name
    zh_name || en_name
  end
end
