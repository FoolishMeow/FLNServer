class ForceCreateAbbreviationUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Abbreviation, :uuid, force: true
  end

  def down
    drop_constraint :Abbreviation, :uuid
  end
end
