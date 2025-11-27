=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
module Luhn

  def self.valid?(input)
    validated = input.gsub(/[\s\t\n\r]+/, '')

    if validated.length <= 1 || validated.match?(/\D+/)
      return false
    end

    sum = validated.chars.reverse.map.with_index { |char, index|
      if index % 2 == 0
        char.to_i
      else
        doubled = char.to_i * 2
        if doubled > 9
          doubled -= 9
        end
        doubled
      end
    }.sum

    sum % 10 == 0
  end
  
end