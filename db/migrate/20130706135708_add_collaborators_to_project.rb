class AddCollaboratorsToProject < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :email
      t.references :project
      t.timestamps
    end
  end
end
