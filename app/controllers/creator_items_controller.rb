class CreatorItemsController < ApplicationController
  def show
    @creator_item = CreatorItem.find(params[:id])
  end
end
