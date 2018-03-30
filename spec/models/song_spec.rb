require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'validations' do
    it 'must have a name' do
      album = Album.create(name: 'spacelounge')
      song = Song.new(album_id: album.id)

      expect(song).to_not be_valid
    end

    it 'must have an album' do
      song = Song.new(name: 'all star')

      expect(song).to_not be_valid
    end

    it 'is valid with all attributes' do
      album = Album.create(name: 'spacelounge')
      song = Song.new(name: 'all star', album_id: album.id)

      expect(song).to be_valid
    end
  end

  describe 'relationships' do
    xit 'belongs to album' do
      album = Album.new(name:'spaceloung')
      song = album.songs.new(name: 'all star')

      expect(song.album.name).to eq('spaceloung')
    end

    it 'has many playlists' do
      album = Album.create(name: 'spacelounge')
      playlist1 = Playlist.create(name: 'Road')
      playlist2 = Playlist.create(name: 'Lounge')
      song = Song.create(name: 'all star', album_id: album.id)

      playlist1.songs << song
      playlist2.songs << song

      expect(song).to respond_to(:playlists)
      expect(song.playlists.first.name).to eq(playlist1.name)
    end
  end

  describe 'uniqueness' do
    it 'cannot have duplicate songs' do
      album1 = Album.create(name: 'spacelounge')
      album2 = Album.create(name: 'space_lounge')
      Song.create(name: 'all star', album_id: album1.id)
      Song.create(name: 'all star', album_id: album1.id)
      Song.create(name: 'all star', album_id: album2.id)

      expect(Song.all.size).to eq(3)
    end
  end
end
