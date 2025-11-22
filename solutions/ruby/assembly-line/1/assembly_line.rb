class AssemblyLine

  PRODUCTION_RATE_PER_HOUR = 221
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    case @speed
      when 1..4
        (@speed * PRODUCTION_RATE_PER_HOUR) * 1
      when 5..8
        (@speed * PRODUCTION_RATE_PER_HOUR) * 0.9
      when 9
        (@speed * PRODUCTION_RATE_PER_HOUR) * 0.8
      when 10
        (@speed * PRODUCTION_RATE_PER_HOUR) * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
