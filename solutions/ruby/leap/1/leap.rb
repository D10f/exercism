class Year
  
  def self.leap?(year)
    if year % 4 == 0 then
      return !(year % 100 == 0 and year % 400 != 0)
    end
  end
  
end