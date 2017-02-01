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

    # these will probably be emojis
    smells = ["probably smells like dog food.", "reeks like a barn.", "is reminiscent of a port-a-potty at a festival."]
    dontsmell = ["shouldn't stink too badly.", "smells like fresh mountain air.", "has air scented air."]

    rand1 = rand(0..2)
    rand2 = rand(0..2)

    return smells[rand1] if stink >= 10
    return dontsmell[rand2]
  end
end
