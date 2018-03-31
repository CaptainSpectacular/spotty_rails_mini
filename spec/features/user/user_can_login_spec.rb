require 'rails_helper'

context 'client visits login page' do
  context 'they have an account' do
    scenario 'they can login with right creds' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')

      visit login_path

      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password
      click_on 'Login'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content('Welcome TheRealIanDouglas')

    end

    scenario 'they cannot login with wrong username' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')

      visit login_path

      fill_in 'session[username]', with: 'IanDouglas'
      fill_in 'session[password]', with: user.password

      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid username/password')
    end

    scenario 'they cannot login with wrong password' do
      user = User.create(username: 'TheRealIanDouglas', password: 'supermutt')

      visit login_path

      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: 'Supermutt'

      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid username/password')
    end
  end
end