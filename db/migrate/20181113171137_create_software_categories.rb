class CreateSoftwareCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :software_categories do |t|
      t.references :software, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
