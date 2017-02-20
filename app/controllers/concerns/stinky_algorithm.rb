module StinkyAlgorithm

  def does_it_smell?(weather)
    wind_dir = weather.wind_dir
    if wind_dir == "SSW" || wind_dir == "S"
      wind_weight = 5
    elsif wind_dir == "SW"
      wind_weight = 4
    else
      wind_weight = 0
    end

    wind_mph = weather.wind_mph
    wind_gust = weather.wind_gust_mph

    # wind direction, multiplied by the velocity, incorporating gusts
    stink = wind_weight + (wind_weight * (wind_mph * 0.1)) + (wind_weight * (wind_gust * 0.05))

    return stink # value above 10 indicates likely stinkiness
  end
end
