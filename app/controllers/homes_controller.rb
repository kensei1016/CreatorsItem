class HomesController < ApplicationController
  def top
    # TODO: おすすめ順はいいね、閲覧トラッキング実装後に実装する
    @work_rooms_recomend = WorkRoom.all.includes([:creator_genre, :user]).limit(6)
    @work_rooms_new = WorkRoom.all.includes([:creator_genre, :user]).limit(6).order(created_at: :desc)

    # aboutページ用
    @creator_genres = CreatorGenre.all
  end

  def about
  end
end
