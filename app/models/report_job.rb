class ReportJob < ActiveJob::Base

  def perform
    w = Wunderground.new(ENV['wunderground_key'])
    # move to ENV
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

    # gather today's weather
    weather_info = resp['current_observation']
    report = Report.new

    report.city = city
    report.wind_dir = weather_info['wind_dir']
    report.wind_mph = weather_info['wind_mph']
    report.wind_gust_mph = weather_info['wind_gust_mph']
    report.wind_description = weather_info['wind_string']
    report.temperature = weather_info['temp_f']
    report.description = weather_info['weather']
    report.save!

  end
end
