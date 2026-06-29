class Matrix

  def row(n)
    self.rows[n - 1].split.map &:to_i
  end

  def column(n)
    col = self.rows.map do |row|
      chars = row.split
      chars[n - 1]
    end
    col.map &:to_i
  end

  private

  attr_accessor :matrix

  def initialize(str)
    self.matrix = str
  end

  def rows
    self.matrix.split "\n"
  end

end
