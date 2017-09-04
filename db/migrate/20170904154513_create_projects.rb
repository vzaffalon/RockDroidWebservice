class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :name
      t.string :creator_id
      t.float :deleted_at
      t.float :persisted_time

      t.timestamps
    end
  end
end
