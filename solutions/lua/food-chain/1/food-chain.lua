local lyrics = [[
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a horse.
She's dead, of course!
]]

string.trim = function(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

string.split = function(s, pattern)
    local chunks = {}

    local i = 0
    local j = 0
    while true do
        i = string.find(s, pattern, i + 1)
        if i == nil then
            table.insert(chunks, string.sub(s, j))
            break
        end
        table.insert(chunks, string.sub(s, j, i))
        j = i + pattern:len()
    end

    return chunks
end

local function verses(from, to)
    local chunks = lyrics:split("\n\n")
    local result = ""
    for index, value in ipairs(chunks) do
        if index >= from and index <= to then
            result = result .. value .. "\n"
        end
    end
    return result
end

local function verse(which)
    local chunks = lyrics:split("\n\n")
    return chunks[which]
end

local function sing()
    return lyrics .. "\n"
end

return {
    verse = verse,
    verses = verses,
    sing = sing
}