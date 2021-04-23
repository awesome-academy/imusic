class Category < ApplicationRecord
  has_many :song_categories
  has_many :songs, through: :song_categories
end
