class ForceCreateInstitutionTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Institution, :type, force: true
  end

  def down
    drop_index :Institution, :type
  end
end
