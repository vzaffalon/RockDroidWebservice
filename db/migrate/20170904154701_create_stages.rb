class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :city
      t.string :name
      t.string :uf
      t.string :project_id
      t.float :persisted_time, null:false
      t.float :initial_date
      t.integer :deleted_at

      t.timestamps
    end
  end
end
