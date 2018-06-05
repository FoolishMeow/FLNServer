class ForceCreateTechnologyTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Technology, :type, force: true
  end

  def down
    drop_index :Technology, :type
  end
end
