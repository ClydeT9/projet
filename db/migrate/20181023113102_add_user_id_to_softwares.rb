class AddUserIdToSoftwares < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :user_id, :integer
  end
end
