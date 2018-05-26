module Neo4j::Searchable
  extend ActiveSupport::Concern

  def contents
    RelatedNode.where(node_id: id).collect(&:content)
  end

  def contents?
    contents.present?
  end
end
