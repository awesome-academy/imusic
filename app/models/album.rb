class Album < ApplicationRecord
  has_many :songs
  has_many :artist_albums
end
