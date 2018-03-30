require 'rails_helper'

context 'visit' do
  context 'album show page' do
    scenario 'can see all album songs' do
      album = Album.create(name: 'spacelounge')
      song1 = album.songs.create(name: 'all star')
      song2 = album.songs.create(name: 'some BODY')
      song3 = album.songs.create(name: 'once told me')

      visit album_path(album)

      expect(page).to have_content(song1.name)
      expect(page).to have_content(song2.name)
      expect(page).to have_content(song3.name)
    end
  end
end