class ForceCreateTechnologyUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Technology, :uuid, force: true
  end

  def down
    drop_constraint :Technology, :uuid
  end
end
