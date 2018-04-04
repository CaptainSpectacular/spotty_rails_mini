require 'rails_helper'

context 'an admin can' do
  before(:each) do
    @admin = User.create(username: 'admin', password: 'admin', role: 1)
    visit login_path
    fill_in 'session[username]', with: @admin.username
    fill_in 'session[password]', with: @admin.password
    click_on 'Login'
  end

  scenario 'create albums' do
    visit new_admin_album_path

    fill_in 'album[name]', with: 'spacelounge'

    click_on 'Save Album'

    expect(current_path).to eq(albums_path)
    expect(Album.all.size).to eq(1)
  end

  scenario 'delete albums' do
    album = Album.create(name: 'spacelounge')
    visit edit_admin_album_path(album)

    click_on 'Delete'

    expect(current_path).to eq(albums_path)
    expect(page).to_not have_content(album.name)
    expect(Album.all.size).to eq(0)
  end
  
  scenario 'edit an album' do
    album = Album.create(name: 'spacelounge')

    visit edit_admin_album_path(album)
    fill_in 'album[name]', with: 'Best Of...'
    click_on 'Update'

    expect(current_path).to eq(edit_admin_album_path(album))
    expect(page).to have_content('Best Of...')
  end
end