class ArtistAlbum < ApplicationRecord
  belong_to :artist
  belong_to :album
end
