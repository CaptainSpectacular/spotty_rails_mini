class SongsController < ApplicationController
  def index
    render locals: { songs: Song.all }
  end
end