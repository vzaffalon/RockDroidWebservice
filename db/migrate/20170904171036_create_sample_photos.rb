class CreateSamplePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_photos, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.text :base64image
      t.string :filename
      t.float :deleted_at
      t.float :persisted_time
      t.string :sample_id

      t.timestamps
    end
  end
end
