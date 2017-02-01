class Neighborhood < ApplicationRecord
  include StinkyAlgorithm

  belongs_to :city
  has_many :reports

  def most_recent_weather_report
    does_it_smell?(self.reports.last)
  end
end
