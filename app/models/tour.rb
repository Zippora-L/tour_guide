class Tour < ApplicationRecord
  has_many :bookings
  belongs_to :user

  def has_spots?
    self.limit_of_people > Booking.where(tour: self).length
  end
end
