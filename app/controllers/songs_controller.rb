class SongsController < ApplicationController
  def index
    render locals: { songs: Song.all }
  end

  def show
    render locals: { song: Song.find(params[:id]) }
  end
end