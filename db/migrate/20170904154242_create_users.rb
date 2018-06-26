class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: false do |t|
      t.string :uuid, null:false, unique: true
      t.string :email, unique: true
      t.integer :deleted_at, :limit => 8
      t.float :persisted_time, null:false
      t.string :name
      t.string :password_hash
      t.string :user_image

      t.timestamps
    end
  end
end
