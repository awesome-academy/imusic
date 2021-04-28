class ArtistsController < ApplicationController
  before_action :find_artist, only: %i[show]

  def show
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
end
