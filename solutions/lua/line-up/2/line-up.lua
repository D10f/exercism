return {
  format = function(name, number)
    local text = "%s, you are the %d%s customer we serve today. Thank you!"
    local suffix = 'th'

    local ones_place = number % 10
    local tens_place = number % 100

    if ones_place == 1 and tens_place ~= 11 then
      suffix = 'st'
    elseif ones_place == 2 and tens_place ~= 12 then
      suffix = 'nd'
    elseif ones_place == 3 and tens_place ~= 13 then
      suffix = 'rd'
    end

    return string.format(text, name, number, suffix)
  end
}
