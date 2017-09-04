class CreateStructurePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :structure_photos, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.text :base64image
      t.string :filename
      t.float :deleted_at
      t.float :persisted_time

      t.timestamps
    end
  end
end
