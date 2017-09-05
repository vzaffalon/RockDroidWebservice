class CreateStructurePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :structure_photos, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.text :base64image
      t.string :filename
      t.integer :deleted_at
      t.float :persisted_time, null:false

      t.timestamps
    end
  end
end
