json.id @technology.id
json.name do
  json.zh @technology.zh_name
  json.en @technology.en_name
end
json.type t("technology_types.#{@technology.types.first}")
json.summary @technology.summary