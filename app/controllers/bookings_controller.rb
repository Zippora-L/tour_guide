class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def create
    booking = Booking.new(booking_params)
    booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
