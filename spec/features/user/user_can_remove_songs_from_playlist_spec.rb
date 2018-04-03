require 'rails_helper'

context 'the user is logged in' do
  context 'they want to' do
    scenario 'remove songs from playlist' do
      album = Album.create(name: 'spacelounge')
      song = album.songs.create(name: 'all star')
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
      playlist = user.playlists.create(name: 'Road')
      playlist.songs << song

      visit login_path
      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'
      click_on 'My Playlists'
      click_on playlist.name

      expect(page).to have_content(song.name)

      click_on 'Remove From Playlist'

      expect(current_path).to eq(user_playlist_path(user, playlist))
      expect(page).to_not have_content(song.name)
    end
  end
end