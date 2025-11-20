=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

module Hamming
  def self.compute(a, b)
    if a.length != b.length
      raise ArgumentError
    end

    result = 0

    a.each_char.with_index do | char, idx |
      if char != b[idx]
        result += 1
      end
    end

    result
  end
end