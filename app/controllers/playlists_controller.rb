class PlaylistsController < ApplicationController
  def show
    render locals: { playlist: Playlist.find(params[:id]) }
  end

  def index
    render locals: { playlists: current_user.playlists }
  end

  def new
    render locals: { playlist: Playlist.new }
  end

  def create
    playlist = Playlist.new(playlist_params)
    if playlist.save
      current_user.playlists << playlist
      redirect_to user_playlist_path(current_user.id, playlist)
    else
      flash.now[:danger] = 'Something went wrong. Try making the playlist again'
      render 'new'
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
