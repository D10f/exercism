string.split = function(s, delim)
    local chunks = {}
    local length = #s
    local j = 1

    for i = 1, length do
        local char = s:sub(i, i)
        if char == delim then
            local substr = s:sub(j, i - 1)
            table.insert(chunks, substr)
            j = i + 1
        end
    end

    if j <= length then
        local substr = s:sub(j, length)
        table.insert(chunks, substr)
    end

    return chunks
end

return function(s)
    return {
        row = function(n)
            local rows = s:split('\n')
            local nums = rows[n]:split(' ')
            local res  = {}
            for _, v in ipairs(nums) do
                table.insert(res, tonumber(v))
            end
            return res
        end,

        column = function(n)
            local rows = s:split('\n')
            local cols = {}
            for _, row in ipairs(rows) do
                local num = tonumber(row:split(' ')[n])
                table.insert(cols, num)
            end
            return cols
        end
    }
end
