class ForceCreateResourceTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Resource, :type, force: true
  end

  def down
    drop_index :Resource, :type
  end
end
