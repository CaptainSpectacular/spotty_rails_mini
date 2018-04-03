class SongsController < ApplicationController
  def index
    playlist_options = current_user.options if current_user

    render locals: { songs: Song.all, playlist_options: playlist_options }
  end

  def show
    playlist_options = current_user.options if current_user

    render locals: { song: Song.find(params[:id]), playlist_options: playlist_options }
  end
end