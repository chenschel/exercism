class Matrix
  attr_reader :rows

  private

  def initialize(matrix_string)
    @rows = parse_matrix_string(matrix_string)
  end

  def parse_matrix_string(matrix_string)
    matrix_string.split("\n").map do |row|
      row.scan(/\b\d+\b/).map(&:to_i)
    end
  end

  public

  def columns
    rows.transpose
  end
end
