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
end
