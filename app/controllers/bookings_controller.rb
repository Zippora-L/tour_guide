class BookingsController < ApplicationController
  def index
    @allbookings = Booking.all
    @allbookings = policy_scope(Booking).where(user: current_user)
  end

  def create
    @tour = Tour.find(params[:tour_id])
    Booking.where(tour: @tour)
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @booking.tour = @tour
    @booking.status = "Pending confirmation"
    @booking.save
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    authorize @booking
    @booking = Booking.find(params[:id])
    Booking.delete(@booking.id)
    redirect_to tour_path(@tour)
  end

  def confirm
    @tour = Tour.find(params[:id])
    @booking = Booking.find(params[:format])
    authorize @booking
    @booking.status = "Confirmed"
    @booking.save
    redirect_to tour_path(@tour)
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
