class Admin::SongsController < ApplicationController
  before_action :require_admin
  before_action :find_song, only: %i[edit update destroy]
  def new
    @song = Song.new
    @albums = Album.all
    @countries = Country.all
    @categories = Category.all
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_songs_path
    else
      @albums = Album.all
      @countries = Country.all
      @categories = Category.all
      render :new
    end
  end

  def index
    @songs = Song.paginate(page: params[:page])
  end

  def edit
    @albums = Album.all
    @countries = Country.all
    @categories = Category.all
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render "edit"
    end
  end

  def destroy
    @song.destroy
    flash[:success] = "Song deleted"
    redirect_to admin_songs_path
  end
  private

  def find_song
    @song = Song.find_by(id: params[:id])
    unless @song
      redirect_to root_path
    end
  end

  def song_params
    params.require(:song).permit(:name, :album_id, :country_id, :audio, :category_ids => [])
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
