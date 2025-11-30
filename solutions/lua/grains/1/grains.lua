local grains = {}

function grains.square(n)
  return math.floor(2 ^ (n - 1))
end

function grains.total()
  return grains.square(65)
end

return grains
