class Numeric
  def divisible?(n)
    self % n == 0
  end
end

class Raindrops
  def self.convert(number)
    result = ''
    result << 'Pling' if number.divisible?(3)
    result << 'Plang' if number.divisible?(5)
    result << 'Plong' if number.divisible?(7)
    result.empty? ? number.to_s : result
  end
end
