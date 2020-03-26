class CreatorItem < ApplicationRecord
  belongs_to :work_room

  # オブジェクトがインスタンス化されるタイミングで実行（findのときも）
  after_initialize do |creator_item|
    begin
      @search_result_item = RakutenWebService::Ichiba::Item.search(itemCode: item_code).first
    rescue => exception
      @search_result_item = nil
    end
  end

  def item_image
    @search_result_item['mediumImageUrls'][0] unless @search_result_item.nil?
  end

  def item_name
    @search_result_item['itemName'] unless @search_result_item.nil?
  end

  def item_price
    @search_result_item['itemPrice'].to_s(:delimited) unless @search_result_item.nil?
  end

  # アイテムを使用した投稿を全て返す
  def item_use_work_rooms
    return WorkRoom.none if search_word.nil?
    same_creator_items = CreatorItem.where("search_word LIKE ?", "%#{search_word}%")
    WorkRoom.where(id: same_creator_items.pluck(:work_room_id))
  end

end
