local animals       = {
    { "fly",    "I don't know why she swallowed the fly. Perhaps she'll die.\n" },
    { "spider", "It wriggled and jiggled and tickled inside her.\n" },
    { "bird",   "How absurd to swallow a bird!\n" },
    { "cat",    "Imagine that, to swallow a cat!\n" },
    { "dog",    "What a hog, to swallow a dog!\n" },
    { "goat",   "Just opened her throat and swallowed a goat!\n" },
    { "cow",    "I don't know how she swallowed a cow!\n" },
    { "horse",  "She's dead, of course!\n" }
}

local opening_verse = "I know an old lady who swallowed a %s.\n"
local swallow_verse = "She swallowed the %s to catch the %s.\n"
local spider_verse  = "She swallowed the %s to catch the %s %s"

local function verse(which)
    local animal, phrase = table.unpack(animals[which])
    local result = opening_verse:format(animal) .. phrase

    if which == #animals then
        return result
    end

    local i = which
    while i > 1 do
        local prev_animal, prev_phrase = table.unpack(animals[i - 1])

        if prev_animal == "spider" then
            prev_phrase = string.gsub(prev_phrase, "It", "that")
            result = result .. spider_verse:format(animal, prev_animal, prev_phrase)
        else
            result = result .. swallow_verse:format(animal, prev_animal)
        end

        if prev_animal == "fly" then
            result = result .. prev_phrase
        end

        animal = prev_animal
        i = i - 1
    end

    return result
end

local function verses(from, to)
    local result = ''
    for i = from, to do
        result = result .. verse(i) .. "\n"
    end
    return result
end

local function sing()
    return verses(1, #animals)
end

return {
    verse = verse,
    verses = verses,
    sing = sing
}