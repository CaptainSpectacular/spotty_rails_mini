require 'rails_helper'

context 'the user is snoopy' do
  context 'they try and visit' do
    before(:each) do
      @user = User.create(username: 'haxor', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    scenario 'admin/users' do
      visit admin_users_path

      expect(status_code).to eq(404)
      expect(page).to_not have_content(@user.username)
    end

    scenario 'admin/users/:id' do
      visit admin_users_path(@user)

      expect(status_code).to eq(404)
      expect(page).to_not have_content(@user.username)
      expect(page).to_not have_content('Promote')
    end
  end
end