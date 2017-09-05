class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :name
      t.float :persisted_time, null:false
      t.string :outcrop_id
      t.integer :deleted_at

      t.timestamps
    end
  end
end
