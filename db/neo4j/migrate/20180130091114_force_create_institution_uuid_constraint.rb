class ForceCreateInstitutionUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Institution, :uuid, force: true
  end

  def down
    drop_constraint :Institution, :uuid
  end
end
