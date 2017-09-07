class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :name
      t.string :creator_id
      t.string :user_id
      t.integer :deleted_at, :limit => 8
      t.float :persisted_time, null:false

      t.timestamps
    end
  end
end
