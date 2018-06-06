class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.string :nodes, array: true, default: []
      t.string :edges, array: true, default: []
      t.string :title, null: false
      t.text :desc

      t.timestamps
    end
  end
end
