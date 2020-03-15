class AddWorkRoomRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :work_room, foreign_key: true
  end
end
