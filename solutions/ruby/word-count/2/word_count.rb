class Phrase

  attr_reader :word_count
  
  private
  
  attr_writer :word_count
  
  def initialize(phrase)
    self.word_count = phrase.downcase.scan(/\b[\w']+\b/).tally
  end

end
