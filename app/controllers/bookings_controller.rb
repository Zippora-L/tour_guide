class BookingsController < ApplicationController
  def create
  end

  def index
    @bookings = current_user.bookings
  end
end
