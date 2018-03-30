require 'rails_helper'

context 'user visits' do
  context 'song show page' do
    scenario 'they see song information' do
      album = Album.create(name: 'spacelounge')
      song = album.songs.create(name: 'all star')

      visit song_path(song)

      expect(page).to have_content(song.name)
      expect(page).to have_content(song.album.name)
    end
  end
end