class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show]

  def show
    albumview = @album.view.to_i + 1
    @album.update_attribute :view, albumview
  end

  private

  def find_album
    @album = Album.find_by(id: params[:id])
    unless @album
      redirect_to root_path
    end
  end

  def album_params
    params.require(:album).permit(:name, :image, :artist_ids => [])
  end
end
