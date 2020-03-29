class WorkRoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :baria_user, only: [:edit, :update, :destroy]

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
    
    impressionist(@work_room)
    @page_views = @work_room.impressionist_count(:filter=>:session_hash)

    @comment = Comment.new
    @post_comments = Comment.where(work_room_id: @work_room.id).includes([:user]).order(created_at: :desc)
  end

  def edit
    @work_room = WorkRoom.find(params[:id])
  end

  def update
    @work_room = WorkRoom.find(params[:id])
    if @work_room.update(work_room_params)
      redirect_to current_user, notice: "投稿を更新しました。"
    end
  end

  def destroy
    work_room = WorkRoom.find(params[:id])
    work_room.destroy
    redirect_to current_user, notice: "投稿を削除しました。"
  end

  def index
    @work_rooms = WorkRoom.all

    # ジャンルによる絞り込みがある場合
    if params[:genre_id].present?
        @creator_genre = CreatorGenre.find(params[:genre_id])
        @work_rooms = @work_rooms.where(creator_genre_id: @creator_genre.id)
    end

    # タグによる絞り込みがある場合
    if params[:tag_name].present?
      @tag_name = params[:tag_name]
      @work_rooms = @work_rooms.tagged_with(@tag_name)
    end
    
    @work_rooms = @work_rooms.includes([:creator_genre, :user]).page(params[:page])
    
  end

  def index_new
    @work_rooms_new = WorkRoom.all.includes([:creator_genre, :user]).order(created_at: :desc).page(params[:page])
  end

  def index_recomend
    @work_rooms_recomend = WorkRoom.all.includes([:creator_genre, :user]).page(params[:page])
  end

  def search
    @work_rooms = @q.result(distinct: true).includes([:creator_genre, :user]).page(params[:page]).reverse_order
  end

  def search_api
    @search_word = params[:search_word]
    @search_result_items = search_rakuten_api(keyword: @search_word)
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
                creator_items_attributes: [:search_word, :item_url, :external_site_name, :item_code],
                work_room_images_images: [])
  end

  def baria_user
    work_room = WorkRoom.find(params[:id])
		unless work_room.user.id.to_i == current_user.id
  		redirect_to work_rooms_path
  	end
  end

end
