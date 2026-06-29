class Matrix

  def row(index)
    self.matrix[index - 1]
  end

  def column(index)
    self.matrix.map { |row| row[index -1] }
  end

  private

  attr_accessor :matrix

  def initialize(input_str)
    self.matrix = input_str.split("\n").map { |row| row.split.map(&:to_i) }
  end

end
