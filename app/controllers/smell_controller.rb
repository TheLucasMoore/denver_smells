class SmellController < ApplicationController
  def index
    @city = City.find(1) #hardcoded to Denver right now
    @weather = Report.where(city_id: @city.id).last
  end
end
