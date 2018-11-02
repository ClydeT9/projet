class AddAvatarToEditors < ActiveRecord::Migration[5.2]
  def change
    add_column :editors, :avatar, :string
  end
end
