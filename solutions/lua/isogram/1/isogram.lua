return function(s)
  local freq_map = {}

  for i = 1, #s do
    local letter = string.lower(string.sub(s, i, i))

    if freq_map[letter] and not string.find(letter, "[%s-]") then
      return false
    end
    
    freq_map[letter] = true
  end

  return true
end
