class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    if !ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation
    end

    if !first_operand.is_a?(Integer) || !second_operand.is_a?(Integer)
      raise ArgumentError
    end

    if operation == "/" && second_operand == 0
      return "Division by zero is not allowed."
    end

    result = 0
    
    case operation
    when "+"
      result = first_operand + second_operand
    when "/"
      result = first_operand / second_operand
    when "*"
      result = first_operand * second_operand
    end
    
    return "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
