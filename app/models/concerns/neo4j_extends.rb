module Neo4jExtends
  extend ActiveSupport::Concern
  include Neo4j::ActiveNode
  include Neo4j::Searchable

  # Using labels in neo4j as tags
  def update_tags(*tags)
    tags = yield(tags) if block_given?
    labels_to_remove = (labels - tags - self.class.mapped_label_names)
    labels_to_add = (tags - labels)

    remove_labels(*labels_to_remove) if labels_to_remove.present?
    add_labels(*labels_to_add) if labels_to_add.present?
    labels
  end

  def to_partial_path
    "graph_#{self.class.mapped_label_name.downcase}"
  end
end
