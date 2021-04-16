class SongsController < ApplicationController
  before_action :find_song, only: %i[show edit update destroy]
  def new
    @song = Song.new
    @albums = Album.all
    @countries = Country.all
  end

  def create
    @song = Song.new(song_params)
    # @song.audio.attach(params[:song][:audio])
    if @song.save
      redirect_to @song
    else
      @albums = Album.all
      @countries = Country.all
      render :new
    end
  end

  def show
  end

  def edit
    @albums = Album.all
    @countries = Country.all
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
    redirect_to songs_url
  end
  private

  def find_song
    @song = Song.find_by(id: params[:id])
    unless @song
      redirect_to root_path
    end
  end

  def song_params
    params.require(:song).permit(:name, :album_id, :country_id, :audio)
  end

end
