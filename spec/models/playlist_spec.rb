require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe 'validations' do
    it 'must have a name' do
      playlist = Playlist.new()

      expect(playlist).to_not be_valid
    end

    it 'is valid with all attributes' do
      playlist = Playlist.new(name: 'Road')

      expect(playlist).to be_valid
    end
  end

  describe 'relationships' do
    it 'can have many songs' do
      playlist = Playlist.new(name: 'Road')
      song1 = Song.new(name: 'On the Road Again')
      song2 = Song.new(name: 'Hit the Road Jack')
      playlist << song1
      playlist << song2

      expect(playlist).to respond_to(:songs)
      expect(playlist.songs).to eq([song1, song2])
    end
  end
end
