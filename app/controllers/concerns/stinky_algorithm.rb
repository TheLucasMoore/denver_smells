module StinkyAlgorithm

  def does_it_smell?(weather)
    wind_dir = weather['wind_dir']
    if wind_dir.include?("SW") || wind_dir == "South"
      wind_weight = 5
    else
      wind_weight = 0
    end

    wind_mph = weather['wind_mph'].to_i
    wind_gust = weather['wind_gust_mph'].to_i

    # wind direction, multiplied by the velocity, incorporating gusts
    stink = wind_weight + (wind_weight * (wind_mph * 1)) + (wind_weight * (wind_gust * 0.5))

    return stink.to_i # value above 10 indicates likely stinkiness
  end
end
