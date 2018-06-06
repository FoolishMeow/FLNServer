class CreateEdges < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :edges, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :source
      t.string :target
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
