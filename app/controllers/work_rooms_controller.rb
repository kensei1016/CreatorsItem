class WorkRoomsController < ApplicationController
  def new
    @work_room = WorkRoom.new
  end

  def create
    @work_room = current_user.work_rooms.build(work_room_params)
    if @work_room.save
      redirect_to mypage_path, notice: "投稿が完了しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def index_new
  end

  def index_reccomend
  end

  def search
  end

  private

  def work_room_params
    params.require(:work_room).permit(:creator_genre_id, :caption, :tag_list, work_room_images_images: [])
  end
end
