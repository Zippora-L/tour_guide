class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
    @tours = current_user.tours if current_user.tour_guide
  end
end
