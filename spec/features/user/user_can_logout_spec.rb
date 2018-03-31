require 'rails_helper'

context 'the user is logged in' do
  context 'they want to logout' do
    scenario 'they can logout' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')

      visit login_path

      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'

      expect(page).to have_content('Logout')

      click_on 'Logout'

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content('Logout')
    end
  end
end
