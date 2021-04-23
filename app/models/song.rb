class Song < ApplicationRecord
  belongs_to :country
  belongs_to :album
  has_one :beat
  has_many :comments
  has_many :histories
  has_many :favorite_songs
  has_many :views
  has_many :song_categories
  has_many :categories, through: :song_categories
  has_many :artist_songs

  has_one_attached :audio
  # validates :audio, content_type: {in %w[audio/mpeg], message: "must be a valid audio format"}
end
