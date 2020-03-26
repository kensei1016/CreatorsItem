class CreatorItemsController < ApplicationController
  def show
    @creator_item = CreatorItem.find(params[:id])
    @item_use_work_rooms = @creator_item.item_use_work_rooms.page(params[:page])
  end
end
