class CreateRocks < ActiveRecord::Migration[5.0]
  def change
    create_table :rocks, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :composition
      t.string :degree
      t.string :mineralogy
      t.string :name
      t.string :nomenclature
      t.string :size
      t.string :texture
      t.string :trama
      t.integer :type
      t.float :persisted_time, null:false
      t.string :outcrop_id
      t.integer :deleted_at

      t.timestamps
    end
  end
end
