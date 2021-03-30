class User < ApplicationRecord
  has_many :comments
  has_many :histories
  has_many :favorite_lists
end
