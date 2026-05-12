class EliudsEggs

  def self.egg_count(decimal_counter)
    decimal_counter.to_s(2).count('1')
  end
  
end