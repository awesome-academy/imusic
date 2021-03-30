class FavoriteList < ApplicationRecord
  belong_to :user
  has_many :favorite_songs
end
