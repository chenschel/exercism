require 'byebug'
class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    return 0 if factors.empty?

    factors.flat_map { |factor| calculate_multiples(factor, limit) }
           .uniq
           .select { |val| val < limit }
           .sum
  end

  private

  def calculate_multiples(factor, limit)
    (1...limit).each_with_object([]) { |value, array| array << value * factor }
  end
end
