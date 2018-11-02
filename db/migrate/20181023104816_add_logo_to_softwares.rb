class AddLogoToSoftwares < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :logo, :string
  end
end
