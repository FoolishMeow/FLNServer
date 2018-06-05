class ForceCreatePaperTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Paper, :type, force: true
  end

  def down
    drop_index :Paper, :type
  end
end
