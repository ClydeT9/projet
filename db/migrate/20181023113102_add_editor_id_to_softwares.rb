class AddEditorIdToSoftwares < ActiveRecord::Migration[5.2]
  def change
    add_column :softwares, :editor_id, :integer
  end
end
