require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'must have a name' do
      user = User.create(password: 'password123')

      expect(user).to_not be_valid
    end

    it 'must have a password' do
      user = User.create(username: 'Bennet Foddley')

      expect(user).to_not be_valid
    end

    it 'is valid with all attributes' do
      user = User.create(username: 'Bennet Foddley', password: 'password123')

      expect(user).to be_valid
    end
  end

  describe 'traits' do
    it 'is not an admin by default' do
      user = User.create(username: 'Bennet Foddley', password: 'password123')

      expect(user.is_admin).to eq(false)
    end

    it 'can be an admin' do
      user = User.create(username: 'Bennet Foddley', password: 'password123', is_admin: true)

      expect(user.is_admin).to eq(true)
    end
  end

  describe 'relationships' do
    it 'can have many playlists' do
      playlist1 = Playlist.create(name: 'Road')
      playlist2 = Playlist.create(name: 'Workout')
      user = User.create(username: 'Bennet Foddley', password: 'password123')

      user.playlists << playlist1
      user.playlists << playlist2

      expect(user.playlists.size).to eq(2)
      expect(user.playlists.first.name).to eq(playlist1.name)
      expect(user.playlists.last.name).to eq(playlist2.name)
    end
  end

  describe 'class methods' do
    it 'can authenticate' do
      user = User.create(username: 'lluthor', password: 'password123')

      expect(user.authenticate(user.password)).to eq(user)
      expect(user.authenticate('secret')).to eq(false)

    end
  end

  describe 'instance methods' do
    it '.playlist_options' do
      user = User.create(username: 'lluthor', password: 'password123')
      p1 = user.playlists.create(name: 'Road')
      p2 =  user.playlists.create(name: 'Workout')

      expect(user.options).to eq([[p1.name, p1.id], [p2.name, p2.id]])
    end
  end
end
