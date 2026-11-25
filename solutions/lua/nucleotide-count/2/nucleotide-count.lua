local DNA = {}

function DNA:new(sequence)
    local dna = {
        nucleotideCounts = {
            A = 0,
            G = 0,
            C = 0,
            T = 0
        }
    }

    for i = 1, #sequence do
        local letter = string.sub(sequence, i, i)
        assert(dna.nucleotideCounts[letter], 'Invalid sequence')
        dna.nucleotideCounts[letter] = dna.nucleotideCounts[letter] + 1
    end

    self.__index = self
    return setmetatable(dna, self)
end

return DNA
