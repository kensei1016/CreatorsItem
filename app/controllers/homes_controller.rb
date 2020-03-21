class HomesController < ApplicationController
  def top
    # TODO: おすすめ順はいいね、閲覧トラッキング実装後に実装する
    @work_rooms_recomend = WorkRoom.all.includes([:creator_genre]).includes([:user])
    @work_rooms_new = WorkRoom.all.includes([:creator_genre]).includes([:user]).order(created_at: :desc)

    # aboutページ用
    @creator_genres = CreatorGenre.all
  end

  def about
  end
end
