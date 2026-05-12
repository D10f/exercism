class EliudsEggs

  def self.egg_count(counter)
    eggs = 0
    temp = counter
    bits = counter.bit_length + 1
    
    bits.times do
      if temp & 1 == 1
        eggs = eggs + 1
      end
      temp = temp >> 1
    end

    eggs
  end
  
end