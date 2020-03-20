class SaveItemsController < ApplicationController
  def create
    @work_room = WorkRoom.find(params[:work_room_id])
    save_item = current_user.save_items.build(work_room_id: @work_room.id)
    save_item.save

    render 'show_save_item_btn'
  end

  def destroy
    @work_room = WorkRoom.find(params[:work_room_id])
    save_item = @work_room.save_items.find_by(user_id: current_user.id)

    save_item.destroy

    render 'show_save_item_btn'
  end
end
