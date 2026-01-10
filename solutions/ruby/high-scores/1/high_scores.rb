=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

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
    sorted = self.scores.sort{| a, b | b <=> a }
    sorted[0..2]
  end

  def latest_is_personal_best?
    self.latest == self.personal_best
  end
  
end