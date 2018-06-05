class ForceCreateInstitutionLevelIndex < Neo4j::Migrations::Base
  def up
    add_index :Institution, :level, force: true
  end

  def down
    drop_index :Institution, :level
  end
end
