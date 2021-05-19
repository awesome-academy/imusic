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
  has_many :artists, through: :artist_songs

  has_one_attached :audio
  # validates :audio, content_type: {in %w[audio/mpeg], message: "must be a valid audio format"}
  has_one_attached :image
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size: { less_than: 5.megabytes, message: "should be less than 5MB" }

  scope :related_category_songs, ->(category_ids) do
    joins(:song_categories).where("song_categories.category_id IN (?)", category_ids).limit(6)
  end

  scope :related_artist_songs, ->(artist_ids) do
    joins(:artist_songs).where("artist_songs.artist_id IN (?)", artist_ids).limit(6)
  end

  scope :search_results, ->{ where("lower(name) LIKE :search", search: "%#{@parameter}%") }

  def create_history(current_user)
    unless current_user.blank?
      History.create(user_id: current_user.id, song_id: self.id)
    end
  end
  
end
