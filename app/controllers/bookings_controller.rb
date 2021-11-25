class BookingsController < ApplicationController

  def index_user
    @userbookings = current_user.bookings
  end

  def index
    @allbookings = Booking.all
  end

  def create
    @tour = Tour.find(params[:tour_id])

    Booking.where(tour:@tour)

    booking = Booking.new
    booking.user = current_user
    booking.tour = @tour
    booking.status = "Pending confirmation"
    booking.save
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.find(params[:id])
    Booking.delete(@booking.id)
    redirect_to tour_path(@tour)
  end

  def confirm!
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.find(params[:id])
    @booking.status = "Confirmed"
    @booking.save
    redirect_to tour_path(@tour)
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
