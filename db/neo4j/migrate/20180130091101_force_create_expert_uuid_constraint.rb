class ForceCreateExpertUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Expert, :uuid, force: true
  end

  def down
    drop_constraint :Expert, :uuid
  end
end
