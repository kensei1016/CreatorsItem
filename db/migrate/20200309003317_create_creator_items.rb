class CreateCreatorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :creator_items do |t|
      t.references :work_room

      t.string :external_site_name,   null: false
      t.string :item_url,             null: false
      t.string :item_code,            null: false

      t.timestamps
    end
  end
end
