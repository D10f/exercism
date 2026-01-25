local Clock = {}
Clock.__index = Clock

function Clock.at(hours, minutes)
  local h, m = Clock:_normalize(hours or 0, minutes or 0)
  return setmetatable({
    hours = h,
    minutes = m 
  }, Clock)
end

function Clock:plus(minutes)
  local h, m = Clock:_normalize(self.hours, self.minutes + minutes)
  self.hours = h
  self.minutes = m
  return self
end

function Clock:minus(minutes)
  local h, m = Clock:_normalize(self.hours, self.minutes - minutes)
  self.hours = h
  self.minutes = m
  return self
end

function Clock:equals(clock)
  return self == clock
end

function Clock:_normalize(hours, minutes)
  local overflow = math.floor(minutes / 60)
  local total_hours = (hours + overflow) % 24
  local total_minutes = minutes % 60
  return total_hours, total_minutes
end

Clock.__tostring = function(self)
  return string.format("%.2d:%.2d", self.hours, self.minutes)
end

Clock.__eq = function(self, other)
  return self.hours == other.hours and self.minutes == other.minutes
end

return Clock
