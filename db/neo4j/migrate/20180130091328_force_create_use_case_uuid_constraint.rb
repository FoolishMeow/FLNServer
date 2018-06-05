class ForceCreateUseCaseUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :UseCase, :uuid, force: true
  end

  def down
    drop_constraint :UseCase, :uuid
  end
end
