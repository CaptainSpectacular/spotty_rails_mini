class Playlist::SongsController < ApplicationController

  def create
    playlist = Playlist.find(params[:playlist][:id])
    playlist.add_song(params[:playlist][:song_id])

    redirect_back(fallback_location: { controller: 'song', action: 'show' })
  end

  def destroy
    playlist = Playlist.find(params[:playlist])
    playlist.remove_song(params[:id])

    redirect_back(fallback_location: { controller: 'playlist', action: 'show' })
  end
end