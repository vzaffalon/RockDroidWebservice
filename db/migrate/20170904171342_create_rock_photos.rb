class CreateRockPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :rock_photos, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.text :base64image
      t.string :filename
      t.string :rock_id
      t.float :deleted_at
      t.float :persisted_time

      t.timestamps
    end
  end
end
