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
      song1 = Song.create(name: 'On the Road Again')
      song2 = Song.create(name: 'Hit the Road Jack')
      playlist.songs  << song1
      playlist.songs << song2

      expect(playlist).to respond_to(:songs)
      expect(playlist.songs).to eq([song1, song2])
    end

    scenario 'cannot have duplicate songs' do
      album1 = Album.create(name: 'spacelounge')
      album2 = Album.create(name: 'dark souls ost')
      song1 = Song.create(name: 'On the Road Again', album_id: album1.id)
      song2 = Song.create(name: 'On the Road Again', album_id: album2.id)
      song3 = Song.create(name: 'Hit the Road Jack', album_id: album1.id)
      playlist = Playlist.new(name: 'Road')

      playlist.songs << song1
      playlist.songs << song2
      playlist.songs << song3
      playlist.songs << song3

      expect(playlist.songs).to eq([song1, song2, song3])
      expect(playlist.songs.size).to eq(3)
    end
  end
end
