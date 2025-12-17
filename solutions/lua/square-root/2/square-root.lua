local SquareRoot = {}

function SquareRoot.square_root(radicand)
  local lower_bound = 0
  local upper_bound = radicand + 1

  while lower_bound ~= upper_bound - 1 do
    local middle = (lower_bound + upper_bound) // 2
    if middle * middle <= radicand then
      lower_bound = middle
    else
      upper_bound = middle
    end
  end

  return lower_bound
end

return SquareRoot
