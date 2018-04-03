class Album < ApplicationRecord
  validates :name, presence: true
  has_many :songs

  def self.options
    names = Album.pluck(:name)
    ids = Album.pluck(:id)
    names.zip(ids)
  end
end
