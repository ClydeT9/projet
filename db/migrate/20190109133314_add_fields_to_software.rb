class AddFieldsToSoftware < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :approved, :boolean, default: false
  end
end
