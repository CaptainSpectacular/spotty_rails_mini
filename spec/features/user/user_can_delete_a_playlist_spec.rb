require 'rails_helper'

context 'user has a playlist' do
  context 'they can delete it' do
    scenario 'from the show page' do
      album = Album.create(name: 'spacelounge')
      song = album.songs.create(name: 'all star')
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
      playlist = user.playlists.create(name: 'Road')

      visit login_path
      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'
      click_on 'My Playlists'
      click_on playlist.name
      click_on 'Delete'

      expect(current_path).to eq(user_playlists_path(user))
      expect(page).to_not have_content(playlist.name)
      expect(user.playlists.size).to eq(0)
    end

    scenario 'from the index page' do
      album = Album.create(name: 'spacelounge')
      song = album.songs.create(name: 'all star')
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
      playlist = user.playlists.create(name: 'Road')

      visit login_path
      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'
      click_on 'My Playlists'
      click_on 'Delete'

      expect(current_path).to eq(user_playlists_path(user))
      expect(page).to_not have_content(playlist.name)
      expect(user.playlists.size).to eq(0)
    end
  end
end