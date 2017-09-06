class RenameTypeInStructuresToStructureType < ActiveRecord::Migration[5.0]
  def change
    rename_column :structures, :type, :structure_type
  end
end
