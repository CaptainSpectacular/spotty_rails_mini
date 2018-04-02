class PlaylistSongsController < ApplicationController

  def create
    playlist = Playlist.find(params[:playlist])
    playlist.add_song(params[:song])
    redirect_back(fallback_location: { controller: 'song', action: 'show' })
  end

  def destroy
    playlist = Playlist.find(params[:playlist])
    song = Song.find(params[:song])
    playlist.songs.destroy(song)
    redirect_back(fallback_location: { controller: 'playlist', action: 'show' })
  end
end