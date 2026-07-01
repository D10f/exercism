return {
  valid = function(isbn)
    local _isbn = isbn:gsub("-", "")
    local last_char = _isbn:match("^%d%d%d%d%d%d%d%d%d([%dX])$")

    if not last_char then
        return false
    end

    local isbn_slice = _isbn:sub(1, -2)
    local t = 0
    local s = 0

    for i = 1, #isbn_slice do
        local char = isbn_slice:sub(i, i)
        t = t + tonumber(char)
        s = s + t
    end

    t = t + (tonumber(last_char) or 10)
    s = s + t

    return s % 11 == 0
  end
}