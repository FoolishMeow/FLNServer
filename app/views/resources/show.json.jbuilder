json.id @resource.id
json.name @resource.name
json.type t("resource_types.#{@resource.types.first}")
json.links @resource.ext_relationships