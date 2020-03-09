class CreateCreatorGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :creator_genres do |t|
      t.string :name,                 null: false
      t.string :name_en,              null: false
      t.string :genre_icon_image_id
      t.string :genre_image_id

      t.timestamps
    end
  end
end
