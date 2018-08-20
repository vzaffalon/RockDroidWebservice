class RemoveHoHorizontalDatumColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :outcrops, :horizontal_datum
  end
end
