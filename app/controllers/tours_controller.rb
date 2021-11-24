class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit]

  def index
    @tours = Tour.all
  end

  def show
  end

  def new
    @tour = Tour.new
  end

  def edit
  end

  def create
    tour = Tour.new(tour_params)
    tour.save
    redirect_to tours_path
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:title, :description, :limit_of_people, :price, :starting_time, :duration, :status, :destination)
  end

end
