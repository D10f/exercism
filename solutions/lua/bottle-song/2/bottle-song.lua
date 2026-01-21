local BottleSong = {}

local number_words = {
	"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"
}

function BottleSong.recite(start_bottles, take_down)
	local repetitions = 0
	local lyrics = {}

	while repetitions ~= take_down do

		local bottles_left = start_bottles - repetitions

		-- bottles word:       1 -> bottle
		-- bottles next:       2 -> bottles
		local bot_w = bottles_left == 1 and "bottle" or "bottles"
		local bot_n = bottles_left - 1 == 1 and "bottle" or "bottles"

		-- number word:        5 -> five
		-- number next:        5 -> four
		-- number capitalized: five -> Five
		local num_w = number_words[bottles_left]
		local num_n = number_words[bottles_left - 1] or "no"
		local num_c = num_w:gsub("^[a-z]", string.upper)

		local verses = {
			{ "%s green %s hanging on the wall,\n", num_c, bot_w },
			{ "%s green %s hanging on the wall,\n", num_c, bot_w },
			{ "And if %s green %s should accidentally fall,\n", "one", "bottle" },
			{ "There'll be %s green %s hanging on the wall.\n", num_n, bot_n }
		}

		if repetitions > 0 then
			table.insert(lyrics, "\n")
		end

		for _, line in pairs(verses) do
			local s1, s2, s3 = table.unpack(line)
			table.insert(lyrics, s1:format(s2, s3))
		end

		repetitions = repetitions + 1
	end

	return table.concat(lyrics, "")
end

return BottleSong
