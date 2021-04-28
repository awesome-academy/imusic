class Artist < ApplicationRecord
  has_many :artist_songs
  has_many :songs, through: :artist_songs 
  has_many :artist_albums
  has_many :albums, through: :artist_albums
end
