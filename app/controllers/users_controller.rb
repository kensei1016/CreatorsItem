class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @work_rooms = @user.work_rooms.order(created_at: :desc)
    @save_items = @user.save_items.includes([:work_room]).order(created_at: :desc)
  end

  def mypage
    @user = current_user
    @work_rooms = @user.work_rooms.includes([:creator_genre]).order(created_at: :desc)
    @save_items = @user.save_items.includes([:work_room]).order(created_at: :desc)

    render 'show'
  end
end
