class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :name
      t.float :deleted_at
      t.float :persisted_time
      t.string :outcrop_id

      t.timestamps
    end
  end
end
