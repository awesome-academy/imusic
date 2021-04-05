class SongsController < ApplicationController
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.audio.attach(params[:song][:audio])
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:name)
  end
end
