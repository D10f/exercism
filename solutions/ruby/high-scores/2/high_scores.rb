class HighScores

  private

  attr_writer   :scores
  attr_accessor :last_added

  def initialize(scores)
    self.scores = scores
    self.last_added = scores.last
  end

  public

  attr_reader :scores

  def latest
    self.last_added
  end

  def personal_best
    self.scores.max
  end

  def personal_top_three
    self.scores.max(3)
  end

  def latest_is_personal_best?
    self.latest == self.personal_best
  end
  
end