local Clock = {}

function Clock:new()
  local t = {
    hours = 0,
    minutes = 0
  }

  setmetatable(t, self)
  self.__index = self

  self.__tostring = function()
    return string.format("%.2d:%.2d", t.hours, t.minutes)
  end

  self.__eq = function(other)
    return t.hours == other.hours and t.minutes == other.minutes
  end

  return t
end

function Clock.at(hours, minutes)
  local clock = Clock:new()
  clock:_update(hours or 0, minutes or 0)
  return clock
end

function Clock:_update(hours, minutes)
  local total_minutes = self.minutes + minutes
  local minutes_overflow = total_minutes // 60
  local total_hours = self.hours + hours + minutes_overflow
  self.hours = (24 + total_hours) % 24
  self.minutes = (60 + total_minutes) % 60
end

function Clock:plus(minutes)
  self:_update(0, minutes)
  return self
end

function Clock:minus(minutes)
  self:_update(0, -minutes)
  return self
end

function Clock:equals(clock)
  return self == clock
end

return Clock