class AddSearchWordToCreatorItems < ActiveRecord::Migration[5.2]
  def change
    add_column :creator_items, :search_word, :string
  end
end
