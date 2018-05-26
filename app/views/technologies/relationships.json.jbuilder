json.nodes @nodes do |node|
  json.id node.id
  json.name do
    json.zh node.zh_name
    json.en node.en_name
  end
  json.label node.zh_name
  json.type t("technology_types.#{node.types.first}")
end

json.edges @relationships do |relation|
  json.source relation[:source].id
  json.target relation[:target].id
end