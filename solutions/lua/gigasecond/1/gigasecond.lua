local gigasecond = {}

local giga_second = 10 ^ 6

function gigasecond.anniversary(any_date)
  return os.date("%x", any_date + 10 ^ 9)
end

return gigasecond
