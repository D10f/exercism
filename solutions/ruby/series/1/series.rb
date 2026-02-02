class Series

  private

  attr_accessor :digits
  
  def initialize(digits)
    raise(ArgumentError) if digits.empty?
    self.digits = digits.split('')
  end

  public
  
  def slices(length)
    raise(ArgumentError) if length > digits.length
    digits.each_cons(length).map(&:join)
  end
  
end