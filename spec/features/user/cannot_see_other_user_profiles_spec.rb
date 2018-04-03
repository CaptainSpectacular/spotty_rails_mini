require 'rails_helper'

context 'user is snoopy' do
  before(:each) do
    @user = User.create(username: 'haxor', password: 'password')
    @target = User.create(username: 'victim', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context 'they visit' do
    scenario 'another user profile page' do
      visit login_path
      fill_in 'session[username]', with: @user.username
      fill_in 'session[password]', with: @user.password
      click_on 'Login'
      visit user_path(@target)

      expect(page.status_code).to eq(404)
      expect(page).to_not have_content(@target.username)
    end
  end
end