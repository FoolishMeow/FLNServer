class ForceCreatePaperUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Paper, :uuid, force: true
  end

  def down
    drop_constraint :Paper, :uuid
  end
end
