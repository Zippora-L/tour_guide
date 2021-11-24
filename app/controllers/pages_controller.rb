class PagesController < ApplicationController
  def home
    @tour = Tour.new
  end
end
