class Admin::ArtistsController < ApplicationController
  before_action :require_admin
  before_action :find_artist, only: %i[ edit update destroy ]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artists = Artist.all
  end

  def index
    @artists = Artist.paginate(page: params[:page])
  end

  def update
    if @artist.update(song_params)
      redirect_to @artist
    else
      render "edit"
    end
  end

  def destroy
    @artists.destroy
    flash[:success] = "Artist deleted"
    redirect_to admin_artists_path
  end

  private

  def find_artist
    @artist = Artist.find_by(id: params[:id])
    unless @artist
      redirect_to root_path
    end
  end

  def artist_params
    params.require(:artist).permit(:name)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
