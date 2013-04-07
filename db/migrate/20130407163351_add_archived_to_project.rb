class AddArchivedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :archived, :boolean, default: false
  end
end
