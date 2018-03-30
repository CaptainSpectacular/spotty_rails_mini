class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  has_many :user_playlists
  has_many :playlists, through: :user_playlists

  has_secure_password

end
