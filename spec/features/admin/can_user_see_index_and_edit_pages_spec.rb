require 'rails_helper'

context 'an admin' do

  before(:each) do
    @admin = User.create(username: 'admin', password: 'admin', role: 1)
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(@admin)
  end

  context 'visits the user index page' do
    scenario 'they can see all users' do
      user1 = User.create(username: 'TheRealIanDouglas', password: 'supermut')
      user2 = User.create(username: 'lluthor', password: 'password')

      visit admin_users_path

      expect(page).to have_content(@admin.username)
      expect(page).to have_content(@admin.role)
      expect(page).to have_content(user1.username)
      expect(page).to have_content(user1.role)
      expect(page).to have_content(user2.username)
      expect(page).to have_content(user2.role)
    end
  end

  context 'visits a user edit page' do
    scenario 'they can see information and modification' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermut')

      visit edit_admin_user_path(user)

      expect(page).to have_content(user.username)
      expect(page).to have_content(user.role)
      expect(page).to have_content(user.created_at)
      expect(page).to have_content('Delete')
    end
  end
end