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
  end

  describe 'relationships' do
    it 'belongs to album' do
      album = Album.new(name:'spaceloung')
      song = album.songs.new(name: 'all star')

      expect(song.album.name).to eq('spaceloung')
    end
  end
end
