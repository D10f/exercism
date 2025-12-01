local Hamming = {}

function Hamming.compute(a, b)
  assert(#a == #b, "strands must be of equal length")
  local distance = 0
  for i = 1, #a do
    if string.sub(a, i, i) ~= string.sub(b, i, i) then
      distance = distance + 1
    end
  end
  return distance
end

return Hamming
