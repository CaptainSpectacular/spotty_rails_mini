class Admin::SongsController < ApplicationController

  def show
    render locals: { song: Song.find(params[:id]) }
  end

  def new
    render locals: { album_options: Album.options }
  end

  def create
    song = Song.new(song_params)
    if song.save
      flash[:success] = 'Song successfully created.'

      redirect_to song_path(song)
    else
      flash.now[:danger] = 'Invalid input. Try again'
      render 'new', locals: { album_options: Album.options }
    end
  end

  def destroy
    Song.delete(params[:id])

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :album_id)
  end
end
