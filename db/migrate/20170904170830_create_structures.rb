class CreateStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :structures, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :description
      t.float :dip
      t.float :dip_direction
      t.string :name
      t.string :phase
      t.integer :type
      t.integer :deleted_at, :limit => 8
      t.float :persisted_time, null:false
      t.string :outcrop_id

      t.timestamps
    end
  end
end
