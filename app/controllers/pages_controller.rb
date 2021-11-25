class PagesController < ApplicationController
  def home
    @tour = Tour.new
    @tours = Tour.all
  end
end
