class CreateWorkRoomImages < ActiveRecord::Migration[5.2]
  def change
    create_table :work_room_images do |t|
      t.references :work_room
      
      t.string :image_id

      t.timestamps
    end
  end
end
