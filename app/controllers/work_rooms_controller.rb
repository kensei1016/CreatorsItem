class WorkRoomsController < ApplicationController
  def new
    @work_room = WorkRoom.new
  end

  def create
    binding.pry
    @work_room = current_user.work_rooms.build(work_room_params)
    # @work_room.creator_items.build(work_room_creator_items_params)
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

  def index_recomend
  end

  def search
  end

  def search_api
    @search_result_items = search_rakuten_api(params[:search_word])
    @search_site_name = params[:search_site_name]
  end

  # 楽天APIの検索
  def search_rakuten_api(keyword)
		items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  private

  def work_room_params
    params.require(:work_room)
        .permit(:creator_genre_id, :caption, :tag_list, :search_site_name,
                creator_items_attributes: [:item_url, :external_site_name, :item_code],
                work_room_images_images: [])
  end

  # def work_room_creator_items_params
  #   params.require(:work_room)
  #       .permit(creator_items: [:item_url, :external_site_name, :item_code])
  # end
end
