class Playlist < ApplicationRecord
  validates :name, presence: true
  has_many :playlist_songs
  has_many :songs, ->{distinct}, through: :playlist_songs
end
