require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'must have a name' do
      user = User.create(password: 'password123')

      expect(user).to_not be_valid
    end

    it 'is valid with all attributes' do
      user = User.create(name: 'Bennet Foddley', password: 'password123')

      expect(user).to be_valid
    end
  end

  describe 'traits' do
    it 'is not an admin by default' do
      user = User.create(name: 'Bennet Foddley')

      expect(user.is_admin).to eq(false)
    end

    it 'can be an admin' do
      user = User.create(name: 'Bennet Foddley', password: 'password123', is_admin: true)

      expect(user.is_admin).to eq(true)
    end
  end

  describe 'relationships' do
    it 'can have many playlists' do
      playlist1 = Playlist.create(name: 'Road')
      playlist2 = Playlist.create(name: 'Workout')
      user = User.create(name: 'Bennet Foddley', password: 'password123')

      user.playlists << playlist1
      user.playlists << playlist2

      expect(user.playlists.size).to eq(2)
      expect(user.playlists.first.name).to eq(playlist1.name)
      expect(user.playlists.last.name).to eq(playlist2.name)
    end
  end
end
