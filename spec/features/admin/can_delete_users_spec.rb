require 'rails_helper'

context 'the admin' do
  scenario 'can delete a user' do
    admin = User.create(username: 'admin', password: 'admin', role: 1)
    allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)
    user = User.create(username: 'TheRealIanDouglas', password: 'supermut')

    visit admin_user_path(user)
    click_on 'Delete'

    expect(current_path).to eq(admin_users_path)
    expect(page).to_not have_content(user.username)
    expect(User.all.size).to eq(1)
  end
end