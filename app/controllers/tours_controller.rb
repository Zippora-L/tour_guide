class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit]

  def index
    if params[:query]
      @tours = policy_scope(Tour).search_by_title_and_description(params[:query])
    elsif current_user.tour_guide
      @tours = policy_scope(Tour).where(user: current_user)
    else
      @tours = policy_scope(Tour)
    end
  end

  def show
    authorize @tour
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def edit
    authorize @tour
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    authorize @tour
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
