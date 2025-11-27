local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local string_num = tostring(number)
  local exponent = #string_num
  local total = 0
  for i = 1, exponent do
    local digit = string.sub(string_num, i, i)
    total = total + tonumber(digit) ^ exponent
  end
  return total == number
end

return ArmstrongNumbers