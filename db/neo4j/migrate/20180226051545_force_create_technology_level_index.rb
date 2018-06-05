class ForceCreateTechnologyLevelIndex < Neo4j::Migrations::Base
  def up
    add_index :Technology, :level, force: true
  end

  def down
    drop_index :Technology, :level
  end
end
