class CreateCreatorGenresUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :creator_genres_users, id: false do |t|
      t.references :creator_genre,  foreign_key: true, null: false
      t.references :user,           foreign_key: true, null: false
    end
  end
end
