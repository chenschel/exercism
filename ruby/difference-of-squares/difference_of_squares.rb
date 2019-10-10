class Squares
  def initialize(num)
    @range = (1..num)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    @range.sum.abs2 
  end

  def sum_of_squares
    @range.reduce { |acc, num| acc + num.abs2 }
  end     
end
