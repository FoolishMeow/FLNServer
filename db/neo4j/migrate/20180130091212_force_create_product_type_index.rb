class ForceCreateProductTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Product, :type, force: true
  end

  def down
    drop_index :Product, :type
  end
end
