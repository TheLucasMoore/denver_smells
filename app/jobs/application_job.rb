class ApplicationJob < ActiveJob::Base
  PWS_CODES = Hash['Capitol Hill', 'KCODENVE145', 'Cheesman Park', 'KCODENVE206', 'San Rafael Neighborhood', 'KCODENVE131', 'Ballpark', 'KCODENVE187', 'Larimer', 'KCODENVE189', 'Congress Park', 'KCODENVE271', 'Highlands', 'KCODENVE208']

  def perform
    w = Wunderground.new(ENV['wunderground_key'])

    # gather neighborhood forcasts
    PWS_CODES.each do |key, val|
      neighborhood_response = w.forcast_and_conditions_for("pws:#{val}")

      weather_info = neighborhood_response['current_observation']
      report = Report.new

      report.neighborhood = Neighborhood.find_by(name: "#{key}")
      report.wind_dir = weather_info['wind_dir']
      report.wind_gust_mph = weather_info['wind_gust_mph']
      report.wind_description = weather_info['wind_string'].downcase
      report.temperature = weather_info['temp_f']
      report.description = weather_info['weather'].downcase

      # some results are -9999, so catch them as zero
      weather_info['wind_mph'] >= 0 ? report.wind_mph = weather_info['wind_mph'] : report.wind_mph = 0
      report.save!
    end
  end

  def populate_db
    w = Wunderground.new(ENV['wunderground_key'])

    conditions = w.forcast_and_conditions_for("CO", "Denver")
    resp = JSON.parse(conditions.to_json)

    # gather city information
    city_info = resp['current_observation']['display_location']

    city_name = city_info['city']
    city = City.find_or_create_by(name: city_name)

    unless city.persisted?
      city.longitude = city_info['longitude']
      city.latitude = city_info['latitude']
      city.zip = city_info['zip']
      city.state = city_info['state']
      city.save!
    end

    # gather neighborhood information
    PWS_CODES.each do |key, val|
      neighborhood = Neighborhood.find_or_create_by(name: "#{key}")
      response = w.forcast_and_conditions_for("pws:#{val}")
      neighborhood_info = response['current_observation']['observation_location']

      neighborhood.longitude = neighborhood_info['longitude']
      neighborhood.latitude = neighborhood_info['latitude']
      neighborhood.zip = neighborhood_info['zip']
      # api doesn't have zip code currently
      neighborhood.city_id = city.id
      neighborhood.save!
    end
    # don't want to blast the API past 15 requests/min
    sleep(1.minute)
    self.perform
  end
end
