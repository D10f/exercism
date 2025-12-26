function is_upper(codepoint)
  return codepoint >= 65 and codepoint <= 90
end

function is_lower(codepoint)
  return codepoint >= 97 and codepoint <= 122
end

return {
  rotate = function(input, key)
    local result = ""
    
    for i = 1, #input do
      local codepoint = string.byte(input, i)
      
      if is_upper(codepoint) then
        codepoint = (codepoint + key) % 91
        if codepoint < 65 then
          codepoint = codepoint + 65
        end
      elseif is_lower(codepoint) then
        codepoint = (codepoint + key) % 123
        if codepoint < 97 then
          codepoint = codepoint + 97
        end
      end

      result = result .. string.char(codepoint)
    end

    return result
  end
}
