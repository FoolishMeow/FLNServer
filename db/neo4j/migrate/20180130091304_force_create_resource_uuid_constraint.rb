class ForceCreateResourceUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Resource, :uuid, force: true
  end

  def down
    drop_constraint :Resource, :uuid
  end
end
