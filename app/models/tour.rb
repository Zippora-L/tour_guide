class Tour < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :title, :description, :limit_of_people, :price, :duration, :destination, :photo, presence: { message: "must be given please" }
  validates :title, :description, length: { minimum: 4 }
  validates :description, length: { maximum: 500 }
  validates :limit_of_people, :price, :duration, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: [ :title, :description ],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
