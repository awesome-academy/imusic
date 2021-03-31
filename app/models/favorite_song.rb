class FavoriteSong < ApplicationRecord
  belong_to :song
  belong_to :favorite_list
end
