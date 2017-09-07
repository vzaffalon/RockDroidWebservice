class CreateRockStructureAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :rock_structure_associations, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.float :persisted_time, null:false
      t.string :structure_id
      t.string :rock_id
      t.string :outcrop_id
      t.integer :deleted_at, :limit => 8

      t.timestamps
    end
  end
end
