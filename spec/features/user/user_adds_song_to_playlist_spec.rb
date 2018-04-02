require 'rails_helper'

context 'the user is logged in' do
  context 'the user made a playlist' do
    scenario 'they can add from a song show page' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
      playlist = user.playlists.create(name: 'Road')
      album = Album.create(name: 'spacelounge')
      song = album.songs.create(name: 'all star')

      visit login_path
      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'
      click_on 'Songs'
      click_link 'all star'
      click_on playlist.name

      expect(current_path).to eq(song_path(song))

      click_on user.username
      click_on 'My Playlists'
      click_on playlist.name

      expect(current_path).to eq(user_playlist_path(user, playlist))
      expect(page).to have_content(song.name)
    end
  end
end