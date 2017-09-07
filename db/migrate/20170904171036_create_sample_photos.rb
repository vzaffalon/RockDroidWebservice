class CreateSamplePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_photos, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.text :base64image
      t.string :filename
      t.float :persisted_time, null:false
      t.string :sample_id
      t.integer :deleted_at, :limit => 8

      t.timestamps
    end
  end
end
