require 'rails_helper'


context 'the client' do
  context 'has an account' do
    context 'visit the login page' do
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

  context 'does not have an account' do
    context 'they visit the login page' do
      scenario 'they create an account with valid info' do
        visit sign_up_path

        fill_in 'user[username]', with: 'TheRealIanDouglas'
        fill_in 'user[password]', with: 'supermutt'
        fill_in 'user[confirm_password]', with: 'supermutt'
        click_on 'Create Account'

        expect(current_path).to eq(user_path(User.last))
        expect(page).to have_content(User.last.username)
      end

      scenario 'they cannot make an account with non-matching passwords' do
        visit sign_up_path

        fill_in 'user[username]', with: 'TheRealIanDouglas'
        fill_in 'user[password]', with: 'supermutt'
        fill_in 'user[confirm_password]', with: 'Supermutt'
        click_on 'Create Account'

        expect(current_path).to eq(sign_up_path)
        expect(page).to have_content('Passwords do not match')
      end

      scenario 'they cannot make an account with non-matching passwords' do
        User.create(username: 'TheRealIanDouglas', password: 'supermutt')
        visit new_user_path

        fill_in 'user[username]', with: 'TheRealIanDouglas'
        fill_in 'user[password]', with: 'supermutt'
        fill_in 'user[confirm_password]', with: 'supermutt'
        click_on 'Create Account'

        expect(current_path).to eq(sign_up_path)
        expect(page).to have_content('Username already taken!')
      end
    end
  end

  scenario 'the nav bar has a sign in / sign up link' do
    visit root_path

    expect(page).to have_content('Login')
    expect(page).to have_content('Sign Up')
    expect(page).to_not have_content('Logout')
  end
end