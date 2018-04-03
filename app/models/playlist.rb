class Playlist < ApplicationRecord
  validates :name, presence: true
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, -> { distinct }, through: :playlist_songs
  has_many :user_playlists
  has_many :users, through: :user_playlists

  def add_song(song_id)
    songs << Song.find(song_id)
  end

  def remove_song(song_id)
    songs.destroy(song_id)
  end
end
