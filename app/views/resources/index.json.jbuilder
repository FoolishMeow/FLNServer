json.array! @resources do |res|
  json.id res.id
  json.name res.name
  json.type res.types.first
  json.links res.ext_relationships
end