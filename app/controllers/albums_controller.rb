class AlbumsController < ApplicationController
  def index
    render locals: { albums: Album.all }
  end

  def show
    render locals: { album: Album.find(params[:id]) }
  end
end