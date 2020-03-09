class CreateSaveItems < ActiveRecord::Migration[5.2]
  def change
    create_table :save_items do |t|
      t.references :user
      t.references :work_room

      t.timestamps
    end
  end
end
