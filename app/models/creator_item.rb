class CreatorItem < ApplicationRecord
  belongs_to :work_room

  # オブジェクトがインスタンス化されるタイミングで実行（findのときも）
  after_initialize do |creator_item|
    if item_code.present?
      puts "楽天APIの検索"
      @search_result_item = RakutenWebService::Ichiba::Item.search(itemCode: item_code).first
    end
  end

  # after_find do |creator_item|
  #   puts "オブジェクトが見つかりました"
  #   @search_result_items = RakutenWebService::Ichiba::Item.search(itemCode: item_code)
  # end

  def item_image
    @search_result_item['mediumImageUrls'][0]
  end

  def item_name
    @search_result_item['itemName']
  end

  def item_price
    @search_result_item['itemPrice']
  end

  # アイテムを使用した投稿を全て返す
  def item_use_work_rooms
    @same_creator_items = CreatorItem.where("search_word LIKE ?", "%#{search_word}%")
    @same_creator_items.map(&:work_room)
  end

end
