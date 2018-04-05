require 'rails_helper'

context 'the admin' do
  before(:each) do
    @admin = User.create(username: 'admin', password: 'admin', role: 1)
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(@admin)
  end

  scenario 'can delete a user' do
    user = User.create(username: 'TheRealIanDouglas', password: 'supermut')

    visit edit_admin_user_path(user)
    click_on 'Delete'

    expect(current_path).to eq(admin_users_path)
    expect(page).to_not have_content(user.username)
    expect(User.all.size).to eq(1)
  end

  scenario 'can create a user' do
    visit new_admin_user_path

    fill_in 'user[username]', with: 'Fredward'
    fill_in 'user[password]', with: 'password'
    select 'base', from: 'user[role]'
    click_on 'Create User'

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content('Fredward: base')
    expect(User.all.size).to eq(2)
  end

  scenario 'can edit a user' do
    user = User.create(username: 'spengebab', password: 'password')

    visit edit_admin_user_path(user)
    fill_in 'user[username]', with: 'Fredward'
    fill_in 'user[password]', with: 'bumblebee'
    select 'admin', from: 'user[role]'
    click_on 'Update'

    updated = User.find(user.id)

    expect(current_path).to eq(edit_admin_user_path(updated))
    expect(page).to have_content(updated.username)
    expect(updated.password).to_not eq(user.password)
  end

  scenario 'cannot delete or demote other admins' do
    admin2 = User.create(username: 'fredward', password: 'admin', role: 1)
    visit edit_admin_user_path(@admin)

    expect(page).to_not have_content('Delete')
    expect(page).to_not have_content('Demote')

    visit edit_admin_user_path(admin2)

    expect(page).to_not have_content('Delete')
    expect(page).to_not have_content('Demote')
  end
end