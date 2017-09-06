class RenameRocksTypeCollum < ActiveRecord::Migration[5.0]
  def change
    rename_column :rocks, :type, :rock_type
  end
end
