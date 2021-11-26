class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @tour = Tour.new
    @tours = Tour.all
  end
end
