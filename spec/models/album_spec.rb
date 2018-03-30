require 'rails_helper'

RSpec.describe Album, type: :album do
  describe 'validations' do
    it 'must have a name' do
      album = Album.create()

      expect(album).to_not be_valid
    end

    it 'is valid with all attributes' do
      album = Album.new(name: 'spacelounge')

      expect(album).to be_valid
    end
  end

  describe 'relationships' do
    it 'has many songs' do
      album = Album.new(name: 'spacelounge')
      song1 = album.songs.new(name: 'all star')
      song2 = album.songs.new(name: 'some BODY')

      expect(album).to respond_to(:songs)
      expect(album.songs.first.name).to eq(song1.name)
      expect(album.songs.last.name).to eq(song2.name)
    end
  end
end
