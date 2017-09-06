class AddStructureIdCollumToStructurePhotos < ActiveRecord::Migration[5.0]
  def change
      add_column :structure_photos, :structure_id, :string
  end
end
