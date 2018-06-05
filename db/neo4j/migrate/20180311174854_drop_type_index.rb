class DropTypeIndex < Neo4j::Migrations::Base
  disable_transactions!

  def up
    drop_index :Technology,   :type
    drop_index :Resource,     :type
    drop_index :Institution,  :type
    drop_index :Paper,        :type
    drop_index :Product,      :type
    drop_index :Publication,  :type
  end

  def down
    add_index :Technology,   :type
    add_index :Resource,     :type
    add_index :Institution,  :type
    add_index :Paper,        :type
    add_index :Product,      :type
    add_index :Publication,  :type
  end
end
