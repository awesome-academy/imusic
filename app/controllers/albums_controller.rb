class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show edit update destroy]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def show
  end

  def edit
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
    redirect_to albums_url
  end

  private

  def find_album
    @album = Album.find_by(id: params[:id])
    unless @album
      redirect_to root_path
    end
  end

  def album_params
    params.require(:album).permit(:name)
  end
end
