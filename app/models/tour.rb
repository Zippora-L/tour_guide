class Tour < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user


  def has_spots?
    self.limit_of_people > Booking.where(tour: self).length
  end

  def has_bookings?
    Booking.where(tour: self).length != 0
  end

  def active?
    self.status?
  end

  def colour
    if self.status?
      "warning"
    else
      "success"
    end
  end

  def toggle_status!
    if self.active?
      self.status = false
    else
      self.status = true
    end
    self.save!
  end

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
