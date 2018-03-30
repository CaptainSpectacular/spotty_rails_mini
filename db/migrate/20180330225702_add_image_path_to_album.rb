class AddImagePathToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :image_path, :string, default: '/assets/default_album.jpg'
  end
end
