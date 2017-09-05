class CreateOutcrops < ActiveRecord::Migration[5.0]
  def change
    create_table :outcrops, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.float :altitude
      t.float :date_time
      t.string :description
      t.string :horizontal_datum
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :toponomy
      t.string :stage_id
      t.integer :deleted_at
      t.float :persisted_time, null:false

      t.timestamps
    end
  end
end
