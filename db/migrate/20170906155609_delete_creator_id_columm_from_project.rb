class DeleteCreatorIdColummFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :creator_id ,:integer
  end
end
