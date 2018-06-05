class ForceCreateProductUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Product, :uuid, force: true
  end

  def down
    drop_constraint :Product, :uuid
  end
end
