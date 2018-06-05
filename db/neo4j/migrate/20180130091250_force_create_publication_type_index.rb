class ForceCreatePublicationTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Publication, :type, force: true
  end

  def down
    drop_index :Publication, :type
  end
end
