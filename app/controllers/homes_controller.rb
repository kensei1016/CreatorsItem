class HomesController < ApplicationController
  def top
    # おすすめ＝いいねの件数が多い順
    @work_rooms_recomend = 
      WorkRoom.includes([:creator_genre, :user]).find(
        Favorite.group(:work_room_id).order('count(work_room_id) desc').limit(8).pluck(:work_room_id)
      )
    @work_rooms_new = 
      WorkRoom.all.includes([:creator_genre, :user]).limit(8).order(created_at: :desc)

    # aboutページ用
    @creator_genres = CreatorGenre.all
  end

  def about
  end
end
