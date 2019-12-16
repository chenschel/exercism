require 'byebug'
class Matrix
  attr_reader :rows

  def initialize(matrix_string)
    @rows = parse_matrix_string(matrix_string)
  end

  def columns
    rows.transpose
  end

  def saddle_points
    rows.each_with_index
        .select { |row, _x| columns[row.index(row.max)].min == row.max }
        .map { |row, x| [x, row.index(row.max)] }
  end

  private

  def parse_matrix_string(matrix_string)
    matrix_string.split("\n").map do |row|
      row.scan(/\b\d+\b/).map(&:to_i)
    end
  end
end
