class AddPublishedAtToSoftwares < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :published_at, :datetime
  end
end
