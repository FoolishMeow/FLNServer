class RemoveTypeProperty < Neo4j::Migrations::Base
  def up
    remove_property :Technology,   :type
    remove_property :Resource,     :type
    remove_property :Institution,  :type
    remove_property :Paper,        :type
    remove_property :Product,      :type
    remove_property :Publication,  :type
  end

  def down

  end
end
