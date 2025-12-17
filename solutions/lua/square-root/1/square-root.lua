local SquareRoot = {}

function SquareRoot.square_root(radicand)
  
  local result = radicand
  
  for i = 1, radicand do
    local squared = i * i
    local squared_plus_one = (i + 1) * (i + 1)
    
    if squared <= radicand and radicand < squared_plus_one then
      result = i
    end
  end

  return result
end

return SquareRoot
