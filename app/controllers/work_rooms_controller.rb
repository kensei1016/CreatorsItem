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
    @work_room = WorkRoom.find(params[:id])
    
    # impressionist(@work_room, nil, :unique => [:session_hash])
    impressionist(@work_room)
    @page_views = @work_room.impressionist_count

    @comment = Comment.new
    @post_comments = Comment.where(work_room_id: @work_room.id).includes([:user])
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
    @search_result_items = search_rakuten_api(keyword: params[:search_word])
    @search_site_name = params[:search_site_name]
  end

  # 楽天APIの検索
  def search_rakuten_api(keyword: "")
		items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  private

  def work_room_params
    params.require(:work_room)
        .permit(:creator_genre_id, :caption, :tag_list, :search_site_name,
                creator_items_attributes: [:item_url, :external_site_name, :item_code],
                work_room_images_images: [])
  end

end
