local BottleSong = {
    number_words = {
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten"
  }
}

BottleSong.capitalize = function(str)
    return str:gsub("^[a-z]", string.upper)
end

BottleSong.bottle_strings = function(num)
    local current, next

    if num > 2 then
        current = "bottles"
        next    = "bottles"
    elseif num == 2 then
        current = "bottles"
        next    = "bottle"
    else
        current = "bottle"
        next    = "bottles"
    end

    return current, next
end

function BottleSong.recite(start_bottles, take_down)
    local repetitions = 0
    local verses = {}

    repeat
        if repetitions > 0 then
            table.insert(verses, "\n")
        end

        local bottles_left = start_bottles - repetitions
        local bottles_next = bottles_left - 1

        -- bottles word: 1 -> bottle
        -- bottles next: 2 -> bottles
        local bot_w, bot_n = BottleSong.bottle_strings(bottles_left)

        -- number word: '5' -> 'five'
        local num_w = BottleSong.number_words[bottles_left]
        local num_n = BottleSong.number_words[bottles_next] or "no"
        local num_c = BottleSong.capitalize(num_w)

        local verse = {
            {"%s green %s hanging on the wall,\n",             num_c, bot_w},
            {"%s green %s hanging on the wall,\n",             num_c, bot_w},
            {"And if %s green %s should accidentally fall,\n", "one", "bottle"},
            {"There'll be %s green %s hanging on the wall.\n", num_n, bot_n}
        }

        for _, line in pairs(verse) do
            local s1, s2, s3 = table.unpack(line)
            local formatted = s1:format(s2, s3)
            table.insert(verses, formatted)
        end

        repetitions = repetitions + 1
    until repetitions == take_down

    return table.concat(verses, "")
end

return BottleSong
