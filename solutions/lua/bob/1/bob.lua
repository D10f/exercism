local bob = {}

function bob.hey(say)
    local trimmed = say:gsub("%s", "")

    if #trimmed == 0 then
        return "Fine. Be that way!"
    end

    local is_question = trimmed:sub(-1) == "?"
    local is_yelling  = string.match(trimmed:gsub("%A", ""), "^%L+$")

    if is_question and is_yelling then
        return "Calm down, I know what I'm doing!"
    end

    if is_yelling then
        return "Whoa, chill out!"
    end

    if is_question then
        return "Sure."
    end

    return "Whatever."
end

return bob
