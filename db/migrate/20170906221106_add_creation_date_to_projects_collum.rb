class AddCreationDateToProjectsCollum < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :creation_date, :integer, :limit => 8
  end
end
