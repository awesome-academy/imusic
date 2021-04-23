class Admin::AlbumsController < ApplicationController
  before_action :require_admin
  before_action :find_album, only: %i[edit update destroy]

  def new
    @album = Album.new
    @artists = Artist.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to admin_albums_path
    else
      render :new
    end
  end

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def edit
    @artists = Artist.all
  end

  def update
    if @album.update(album_params)
      redirect_to @album
    else
      render "edit"
    end
  end

  def destroy
    @album.destroy
    flash[:success] = "album deleted"
    redirect_to admin_albums_path
  end

  private

  def find_album
    @album = Album.find_by(id: params[:id])
    unless @album
      redirect_to root_path
    end
  end

  def album_params
    params.require(:album).permit(:name, :artist_ids => [])
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
