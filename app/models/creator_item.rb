class CreatorItem < ApplicationRecord
  belongs_to :work_room

  after_initialize do |creator_item|
    @search_result_item = RakutenWebService::Ichiba::Item.search(itemCode: item_code).first
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

end
