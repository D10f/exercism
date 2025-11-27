local Darts = {}

function distance_between_points(x1, y1, x2, y2)
  return math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
end

function Darts.score(x, y)
    local distance = distance_between_points(x, y, 0, 0)
    if distance <= 1  then return 10 end
    if distance <= 5  then return 5  end
    if distance <= 10 then return 1  end
    return 0
end

return Darts
