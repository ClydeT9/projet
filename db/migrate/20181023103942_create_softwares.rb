class CreateSoftwares < ActiveRecord::Migration[5.2]
  def change
    create_table :softwares do |t|
      t.string :title
      t.text :description
      t.string :software_url
      t.string :software_type
      t.string :slogan
      t.string :editeur
      t.string :facebook
      t.string :linkedin
      t.string :twitter
      t.string :video_url
      t.string :target

      t.timestamps
    end
  end
end