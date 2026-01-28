return function(n)
  local number = n
  local steps = 0

  if n <= 0 then
    error('Initial number must be a non-zero positive integer')
  end

  while number ~= 1 do
    steps = steps + 1
    if number % 2 == 0 then
      number = math.floor(number / 2)
    else
      number = number * 3 + 1
    end
  end

  return steps
end
