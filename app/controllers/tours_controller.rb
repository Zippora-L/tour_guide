class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit]

  def index
    if params[:query]
      @tours = Tour.search_by_title_and_description(params[:query])
    else
      @tours = Tour.all
    end
  end

  def show
  end

  def new
    @tour = Tour.new
  end

  def edit
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      redirect_to tours_path
    else
      render :new
    end
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:title, :description, :limit_of_people, :price, :starting_time, :duration, :status, :destination, :photo)
  end
end
