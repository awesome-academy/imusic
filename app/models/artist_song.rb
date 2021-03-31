class ArtistSong < ApplicationRecord
  belong_to :song
  belong_to :artist
end
