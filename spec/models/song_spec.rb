require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'validations' do
    it 'must have a name' do
      song = Song.new()

      expect(song).to_not be_valid
    end

    it 'must have an album' do
      song = Song.new(name: 'all star')

      expect(song).to_not be_valid
    end

    it 'is valid with all attributes' do
      song = Song.new(name: 'all star')

      expect(song).to be_valid
    end
  end

  describe 'relationships' do
    it 'belongs to album' do
      album = Album.new(name:'spaceloung')
      song = album.songs.new(name: 'all star')

      expect(song.album.name).to eq('spaceloung')
    end

    it 'has many playlists' do
      playlist1 = Playlist.new(name: 'Road')
      playlist2 = Playlist.new(name: 'Lounge')
      song = Song.new(name: 'all star')

      playlist1 << song
      playlist << song

      expect(song).to respond_to(:playlists)
      expect(song.playlists).to eq(playlist1, playlist2)
    end
  end
end
