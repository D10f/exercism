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

local metric_prefix = {"kilo", "mega", "giga", "tera", "peta"}

return {
  decode = function(c1, c2, c3)
    local n1 = color_map[c1]
    local n2 = color_map[c2]
    local n3 = color_map[c3]
    
    local value = (n1 * 10 + n2) * (10 ^ n3)
    local unit = "ohms"
    
    local index = 0
    local temp = value
    
    while temp >= 1000 do
      temp = temp / 1000
      index = index + 1
    end

    if index > 0 then
      value = value / (10 ^ (3 * index))
      unit = metric_prefix[index] .. unit
    end
    
    return math.floor(value), unit
  end
}
