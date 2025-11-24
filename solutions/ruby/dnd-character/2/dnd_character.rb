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
    @strength     = self.roll
    @dexterity    = self.roll
    @constitution = self.roll
    @intelligence = self.roll
    @wisdom       = self.roll
    @charisma     = self.roll
    @hitpoints    = 10 + DndCharacter.modifier(@constitution)
  end

  private

  def roll
    results = []
    4.times { results.push(Random.random_number(1..6)) }
    results.sort[1..].sum
  end

end
