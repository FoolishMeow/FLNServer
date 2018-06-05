class ForceCreatePublicationUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Publication, :uuid, force: true
  end

  def down
    drop_constraint :Publication, :uuid
  end
end
