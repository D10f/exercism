class Clock

  attr_reader :hour, :minute

  def ==(other)
    self.hour == other.hour and self.minute == other.minute
  end
  
  def +(other)
    Clock.new(hour: self.hour + other.hour, minute: self.minute + other.minute)
  end

  def -(other)
    Clock.new(hour: self.hour - other.hour, minute: self.minute - other.minute)
  end

  def to_s
    "%02d:%02d" % [self.hour, self.minute]
  end

  private

  attr_writer :hour, :minute

  def initialize(hour: 0, minute: 0)
    extra_hours = minute / 60
    self.hour = (hour + extra_hours) % 24
    self.minute = minute - extra_hours * 60
  end
end
