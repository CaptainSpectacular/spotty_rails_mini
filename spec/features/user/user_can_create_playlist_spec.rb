require 'rails_helper'

context 'logged in user is wants to make a playlist' do
  context 'they go to their home page' do
    scenario 'they make a playlist' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
      visit login_path

      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'
      click_on 'New Playlist'

      expect(current_path).to eq(new_user_playlist_path(user))

      fill_in 'playlist[name]', with: 'Road'
      click_on 'Create Playlist'


      expect(current_path).to eq(user_playlist_path(user, Playlist.last))
      expect(page).to have_content('Road')
    end
  end
end
