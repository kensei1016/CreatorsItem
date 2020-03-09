class CreateWorkRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :work_rooms do |t|
      t.references :user
      t.references :creator_genre

      t.text :caption

      t.timestamps
    end
  end
end
