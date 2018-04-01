class SongsController < ApplicationController
  def index
    render locals: { songs: Song.all }
  end

  def show
    Song.add_songs(params[:id], params[:playlist][:playlist]) if params[:playlist]
    render locals: { song: Song.find(params[:id]) }
  end
end