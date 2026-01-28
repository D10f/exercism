local Character = {}
Character.__index = Character

local function ability(scores)
  local score = 0
  local lowest = 0
  for i = 1, 4 do
    local roll = math.floor(math.random() * 6 + 1)
    score = score + roll
    if lowest == 0 or lowest > roll then
      lowest = roll
    end
  end
  return score - lowest
end

local function modifier(constitution)
  return math.floor((constitution - 10) / 2)
end

function Character:new(name)
  local new_character = {
    name = name,
    strength = ability(),
    dexterity = ability(),
    constitution = ability(),
    intelligence = ability(),
    wisdom = ability(),
    charisma = ability(),
  }

  new_character['hitpoints'] = 10 + modifier(new_character.constitution)
  
  return setmetatable(new_character, self)
end

return {
  Character = Character,
  ability = ability,
  modifier = modifier
}
