require 'rails_helper'

context 'the user is logged in' do
  context 'the user made a playlist' do
    context 'they want to add some songs' do
      scenario 'then can add from a song show page' do
        user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')
        playlist = user.playlists.create(name: 'Road')
        song = Song.create(name: 'all star')

        visit login_path
        fill_in 'session[username]', with: user.username
        fill_in 'session[password]', with: user.password
        click_on 'Login'
        click_on 'Songs'

        find('Add to Playlist').first.click
        click_on 'Road'

        expect(current_path).to eq(user_playlist_path(user, playlist))
        expect(page).to have_content(song.name)
      end
    end
  end
end