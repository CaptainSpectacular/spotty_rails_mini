require 'rails_helper'

context 'an admin can' do
  scenario 'create albums' do
    admin = User.create(username: 'admin', password: 'admin', role: 1)
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)

    visit new_admin_album_path

    fill_in 'album[name]', with: 'spacelounge'

    click_on 'Save Album'

    expect(current_path).to eq(albums_path)
    expect(Album.all.size).to eq(1)
  end

  scenario 'delete albums' do
    admin = User.create(username: 'admin', password: 'admin', role: 1)
    album = Album.create(name: 'spacelounge')
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)
    visit edit_admin_album_path(album)

    click_on 'Delete'

    expect(current_path).to eq(albums_path)
    expect(page).to_not have_content(album.name)
    expect(Album.all.size).to eq(0)
  end

  scenario 'edit an album' do
    admin = User.create(username: 'admin', password: 'admin', role: 1)
    album = Album.create(name: 'spacelounge')
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)
    visit edit_admin_album_path(album)

    fill_in 'album[name]', with: 'Best Of...'
  end
end