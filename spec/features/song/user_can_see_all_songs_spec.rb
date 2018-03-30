require 'rails_helper'

context 'user visits' do
  context 'index' do
    scenario 'can see all songs' do
      album = Album.create(name: 'spacelounge')
      song1 = album.songs.create(name: 'all star')
      song2 = album.songs.create(name: 'some BODY')
      song3 = album.songs.create(name: 'chorus')

      visit songs_path

      expect(page).to have_content(song1.name)
      expect(page).to have_content(song2.name)
      expect(page).to have_content(song3.name)
    end
  end
end