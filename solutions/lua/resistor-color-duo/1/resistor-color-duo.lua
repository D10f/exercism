local color_map = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9,
}

return {
  value = function(colors)
    result = 0
    first = colors[1]
    second = colors[2]
    result = result + color_map[first] * 10
    result = result + color_map[second]
    return result
  end
}
