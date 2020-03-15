class AddWorkRoomIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :work_room, foreign_key: true
  end
end
