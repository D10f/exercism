module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0,4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    ship_identifier.slice(0,3).match(/(oil|gas)/i) ? :A : :B
  end
end
