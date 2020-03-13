class Admin::CreatorGenresController < ApplicationController
  def index
    @creator_genres = CreatorGenre.all
  end

  def new
    @creator_genre = CreatorGenre.new
  end

  def create
    @creator_genre = CreatorGenre.new(creator_genre_params)
    if @creator_genre.save
      redirect_to admin_creator_genres_path, notice: 'You have creatad book successfully.'
    else
      render :new
    end
  end

  def edit
    @creator_genre = CreatorGenre.find(params[:id])
  end

  def update
    @creator_genre = CreatorGenre.find(params[:id])
    if @creator_genre.update(creator_genre_params)
      redirect_to admin_creator_genres_path, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @creator_genre = CreatorGenre.find(params[:id])
    @creator_genre.destroy
    redirect_to admin_creator_genres_path
  end

  private

  def creator_genre_params
    params.require(:creator_genre).permit(:name, :name_en, :genre_image, :genre_icon_image)
  end
end
