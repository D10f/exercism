class BirdCount
  def self.last_week
    [0,2,5,3,7,8,4]
  end

  def initialize(birds_per_day)
    @this_week = birds_per_day
  end

  def yesterday
    @this_week[-2]
  end

  def total
    @this_week.sum
  end

  def busy_days
    @this_week.count { |bird_count| bird_count >= 5 }
  end

  def day_without_birds?
    @this_week.any? { |bird_count| bird_count == 0 }
  end
end
