local Character = {}

local function sum(...)
  local result = 0
  for _, v in ipairs({...}) do
    result = result + v
  end
  return result
end

local function ability()
  local rolls = {
    math.random(1, 6),
    math.random(1, 6),
    math.random(1, 6),
    math.random(1, 6)
  }
  table.sort(rolls)
  return sum(table.unpack(rolls, 1, #rolls - 1))
end

local function modifier(character_constitution)
  return math.floor((character_constitution - 10) / 2)
end

function Character:new(name)
  local character = {
    name = name,
    strength = ability(),
    dexterity = ability(),
    constitution = ability(),
    intelligence = ability(),
    wisdom = ability(),
    charisma = ability()
  }

  character['hitpoints'] = 10 + modifier(character.constitution)
  
  self.__index = self
  return setmetatable(character, self)
end

return {
  Character = Character,
  ability = ability,
  modifier = modifier
}
