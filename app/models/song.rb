class Song < ApplicationRecord
  validates :name, presence: true
  belongs_to :album
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def self.add_songs(song, playlist)
    song = Song.find(song)
    playlist = Playlist.find(playlist)
    playlist.songs << song
  end
end
