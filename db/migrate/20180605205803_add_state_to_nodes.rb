class AddStateToNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :state, :integer, default: 0
  end
end
