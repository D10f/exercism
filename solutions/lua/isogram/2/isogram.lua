return function(s)
  local freq_map = {}

  for char in s:lower():gmatch("%a") do
    if freq_map[char] then
      return false
    end

    freq_map[char] = true
  end

  return true
end
