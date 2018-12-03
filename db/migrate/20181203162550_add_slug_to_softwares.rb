class AddSlugToSoftwares < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :slug, :string
    add_index :softwares, :slug, unique: true
  end
end
