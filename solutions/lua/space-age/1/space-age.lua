local SpaceAge = {}

function SpaceAge:new(seconds)
  local t = {}
  local earth_orbit_seconds = 31557600

  local function get_age(orbital_period_years)
    return tonumber(string.format("%.2f", seconds / (earth_orbit_seconds * orbital_period_years)))
  end

  t.seconds    = seconds
  t.on_mercury = function() return get_age(0.2408467)  end
  t.on_venus   = function() return get_age(0.61519726) end
  t.on_earth   = function() return get_age(1.0)        end
  t.on_mars    = function() return get_age(1.8808158)  end
  t.on_jupiter = function() return get_age(11.862615)  end
  t.on_saturn  = function() return get_age(29.447498)  end
  t.on_uranus  = function() return get_age(84.016846)  end
  t.on_neptune = function() return get_age(164.79132)  end

  self.__index = self
  setmetatable(t, self)
  
  return t
end

return SpaceAge
