class ForceCreateExpertLevelIndex < Neo4j::Migrations::Base
  def up
    add_index :Expert, :level, force: true
  end

  def down
    drop_index :Expert, :level
  end
end
