class Admin::AlbumsController < ApplicationController

  def new
  end

  def create
    album = Album.new(album_params)
    if album.save
      flash[:success] = 'Album saved.'
      redirect_to albums_path
    else
      flash.now[:danger] = 'Invalid info'
      render 'new'
    end
  end

  def edit
    render locals: { album: Album.find(params[:id]) }
  end

  def destroy
    Album.destroy(params[:id])

    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
