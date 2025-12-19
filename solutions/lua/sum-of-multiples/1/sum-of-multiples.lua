Set = {}

function Set:new()
    local set = {}
    setmetatable(set, self)
    self.__index = self
    return set
end

function Set:add(number)
    self[number] = true
end

function Set:sum()
    local total = 0
    for i, _ in pairs(self) do
        total = total + i
    end
    return total
end

return function(numbers)
  return {
    to = function(base)
      local set = Set:new()

      for _, n in pairs(numbers) do
        local top = math.floor((base - 1) / n)
        for i = 1, top do
          set:add(n * i)
        end
      end

      return set:sum()
    end
  }
end
