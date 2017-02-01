class SmellController < ApplicationController

  def index
    @city = City.find(1) #hardcoded to Denver right now
    @neighborhoods = Neighborhood.all
  end
end
