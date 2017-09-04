class CreateRockStructureAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :rock_structure_associations, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.float :deleted_at
      t.float :persisted_time
      t.string :structure_id
      t.string :rock_id
      t.string :outcrop_id

      t.timestamps
    end
  end
end
