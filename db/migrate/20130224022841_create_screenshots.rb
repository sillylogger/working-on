class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :image
      t.text :description
      t.references :project
      t.timestamps
    end
  end
end
