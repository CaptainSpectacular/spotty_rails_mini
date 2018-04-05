require 'rails_helper'

context 'an admin' do
  before(:each) do
    @admin = User.create(username: 'fredward', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  scenario 'adds a song' do
    Album.create(name: 'spacelounge')

    visit new_admin_song_path

    select 'spacelounge', from: 'song[album_id]'
    fill_in 'song[name]', with: 'all star'
    click_on 'Save Song'

    expect(current_path).to eq(song_path(Song.last))
    expect(Song.all.size).to eq(1)
  end

  scenario 'delete a song' do
    album = Album.create(name: 'spacelounge')
    song = album.songs.create(name: 'all star')

    visit edit_admin_song_path(song)

    click_on 'Delete'

    expect(current_path).to eq(songs_path)
    expect(page).to_not have_content(song.name)
    expect(Song.all.size).to eq(0)
  end

  scenario 'edit a song' do
    album = Album.create(name: 'spacelounge')
    song = album.songs.create(name: 'all star')

    visit edit_admin_song_path(song)

    fill_in 'song[name]', with: 'ALLSTAR'
    click_on 'Update'

    expect(current_path).to eq(edit_admin_song_path(song))
    expect(page).to have_content('ALLSTAR')
    expect(page).to_not have_content('all star')
  end
end