return {
  valid = function(isbn)
    local _isbn = isbn:gsub("-", "")
    local last_char = isbn:sub(-1)
    local acc = 0

    if #_isbn ~= 10 then
      return false
    end

    if not tonumber(last_char) and last_char ~= "X" then
        return false
    end

    for i = 1, #_isbn - 1 do
        local char = _isbn:sub(i, i)

        if not tonumber(char) then
            return false
        end

        acc = acc + tonumber(char) * (#_isbn - (i - 1))
    end

    acc = acc + (tonumber(last_char) or 10)

    return acc % 11 == 0
  end
}