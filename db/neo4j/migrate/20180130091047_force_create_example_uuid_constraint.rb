class ForceCreateExampleUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Example, :uuid, force: true
  end

  def down
    drop_constraint :Example, :uuid
  end
end
