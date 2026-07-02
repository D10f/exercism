class Numeric
  def divisible?(n)
    self % n == 0
  end
end

class Raindrops

  def self.convert(number)
    result = ''

    if number.divisible?(3)
      result << 'Pling'
    end

    if number.divisible?(5)
      result << 'Plang'
    end

    if number.divisible?(7)
      result << 'Plong'
    end

    if result.empty?
      return number.to_s
    end

    result

  end
end
