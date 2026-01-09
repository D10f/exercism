alpha_lower_end = string.byte('a')
alpha_upper_end = string.byte('z')
digit_lower_end = string.byte('0')
digit_upper_end = string.byte('9')

function trim_end(str)
  local idx = -1
  while (str:sub(idx, idx) == ' ') do
    idx = idx - 1
  end
  return str:sub(1, idx)
end

return {
  encode = function(plaintext)
    local result = ''
    local buffer = ''

    for i = 1, #plaintext do
      local codepoint = plaintext:lower():byte(i)
      local next_char = -1

      if codepoint >= digit_lower_end and codepoint <= digit_upper_end then
        next_char = codepoint
      elseif codepoint >= alpha_lower_end and codepoint <= alpha_upper_end then
        next_char = alpha_lower_end + (alpha_lower_end - (codepoint - 25))
      end

      if next_char >= 0 then
        buffer = buffer .. string.char(next_char)

        if #buffer == 5 then
          result = result .. buffer .. ' '
          buffer = ''
        end
      end
    end

    if #buffer > 0 then
      result = result .. buffer
    end
    
    return trim_end(result)
  end
}

