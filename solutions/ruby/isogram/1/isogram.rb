=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

module Isogram

  def self.isogram?(input)
    freq_map = {}
    input.each_char { |char|
      next if char == "-" || char == " "
      
      if freq_map.include?(char.downcase)
        return false
      end
      
      freq_map[char.downcase] = 1
    }
    true
  end
  
end