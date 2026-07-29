local get_ordinal_number = function(number)
    local suffix = 'th'
    local stringified = tostring(number)
    local last_two_digits = tonumber(stringified:sub(-2))

    if last_two_digits < 11 or last_two_digits > 13 then
        local last_digit = tonumber(stringified:sub(-1))
        if last_digit == 1 then
            suffix = 'st'
        elseif last_digit == 2 then
            suffix = 'nd'
        elseif last_digit == 3 then
            suffix = 'rd'
        end
    end

    return stringified .. suffix
end

return {
    format = function(name, number)
        local ordinal = get_ordinal_number(number)
        return name .. ', you are the ' .. ordinal .. ' customer we serve today. Thank you!'
    end
}
