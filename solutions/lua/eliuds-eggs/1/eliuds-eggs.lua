local EliudsEggs = {}

function bits_used(number)
  local result = 1
  
  while true do
    if number < 2 ^ result then
      break
    end
    result = result + 1
  end

  return result
end

function EliudsEggs.egg_count(number)
  local temp = number
  local bits_flipped = 0
  local most_significant_bit = bits_used(number)
  
  while most_significant_bit > 0 do
  	most_significant_bit = most_significant_bit - 1
  	local value = 2 ^ most_significant_bit
  
  	if temp >= value then
  		temp = temp - value
  		bits_flipped = bits_flipped + 1
  	end
  end

  return bits_flipped
end

return EliudsEggs
