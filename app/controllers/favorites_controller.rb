class FavoritesController < ApplicationController
  def create
    @work_room = WorkRoom.find(params[:work_room_id])
    favorite = current_user.favorites.build(work_room_id: @work_room.id)
    favorite.save

    render 'show_favorite_btn'
  end

  def destroy
    @work_room = WorkRoom.find(params[:work_room_id])
    favorite = @work_room.favorites.find_by(user_id: current_user.id)

    favorite.destroy

    render 'show_favorite_btn'
  end
end
