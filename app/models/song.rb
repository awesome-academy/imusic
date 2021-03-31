class Song < ApplicationRecord
  belong_to :country
  belong_to :album
  has_one :beat
  has_many :comments
  has_many :histories
  has_many :favorite_songs
  has_many :views
  has_many :song_categories
  has_many :artist_songs
end
