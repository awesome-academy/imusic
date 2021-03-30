class SongCategory < ApplicationRecord
  belong_to :song
  belong_to :category
end
