local color_map = {
  black  = 0,
  brown  = 1,
  red    = 2,
  orange = 3,
  yellow = 4,
  green  = 5,
  blue   = 6,
  violet = 7,
  grey   = 8,
  white  = 9
}

local metric_prefix = {"", "kilo", "mega", "giga", "tera", "peta"}

return {
  decode = function(c1, c2, c3)
    local value = (color_map[c1] * 10 + color_map[c2]) * (10 ^ color_map[c3])
    local index = 1
    while value >= 1000 do
      value = value * (10 ^ -3)
      index = index + 1
    end
    
    return math.floor(value), metric_prefix[index] .. "ohms"
  end
}
