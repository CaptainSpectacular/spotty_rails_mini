class Song < ApplicationRecord
  validates :name, presence: true
  belongs_to :album
end
