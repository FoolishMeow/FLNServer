class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.json :position, default: {"entirety": {}, "hierarchy": {}, "spherical": {}}
      t.string :tipe
      t.string :klass
      t.string :zh_name
      t.string :en_name
      t.string :uid, uniq: true
      t.text :summary

      t.timestamps
    end
  end
end
