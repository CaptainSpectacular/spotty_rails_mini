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

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      redirect_to edit_admin_album_path(album)
      flash[:success] = 'Successfully Updated'
    else
      render 'edit'
      flash.now[:danger] = 'Invalid attributes'
    end
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
