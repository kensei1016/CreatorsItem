class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def show
    @user = User.find(params[:id])
    set_user_items
  end

  def mypage
    @user = current_user
    set_user_items
  end

  def set_user_items
    @work_rooms = @user.work_rooms.includes([:creator_genre]).order(created_at: :desc)
    @work_rooms_page = @work_rooms.page(params[:page]).per(3)
    @save_items = @user.save_items.includes([:work_room]).order(created_at: :desc)

    respond_to do |format|
      format.html {render 'show'}
      format.js { render 'add_work_room_list'}
    end
  end
end
