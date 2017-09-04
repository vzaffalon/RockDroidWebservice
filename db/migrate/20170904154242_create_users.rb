class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: false do |t|
      t.string :uuid, unique: true, index: true, null:false
      t.string :email
      t.float :deleted_at
      t.float :persisted_time
      t.string :name
      t.string :password_hash

      t.timestamps
    end
  end
end
