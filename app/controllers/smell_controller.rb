class SmellController < ApplicationController
  include StinkyAlgorithm

  def index
    @city = City.find(1) #hardcoded to Denver right now
    @weather = Report.where(city_id: @city.id).last
    @stink_report = does_it_smell?(@weather)
  end
end
