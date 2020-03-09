class CreateSaveItems < ActiveRecord::Migration[5.2]
  def change
    create_table :save_items do |t|
      t.references :user
      t.references :creator_item

      t.timestamps
    end
  end
end
