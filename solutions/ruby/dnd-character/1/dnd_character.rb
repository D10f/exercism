=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  
  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  def initialize
    @strength     = Random.random_number(3..18)
    @dexterity    = Random.random_number(3..18)
    @constitution = Random.random_number(3..18)
    @intelligence = Random.random_number(3..18)
    @wisdom       = Random.random_number(3..18)
    @charisma     = Random.random_number(3..18)
    @hitpoints    = 10 + DndCharacter.modifier(@constitution)
  end
  
end
