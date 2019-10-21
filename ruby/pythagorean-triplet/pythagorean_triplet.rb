class Triplet
  attr_reader :a, :b, :c

  class << self
    def where(min_factor: 1, max_factor: nil, sum: nil)
      raise ArgumentError, 'max_factor must not be nil, at least greater than min_factor' if max_factor.nil? || max_factor < min_factor

      values = (min_factor..max_factor).to_a
      triplets = values.permutation(3).map do |abc|
        triplet = Triplet.new(*abc)
        triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
      end

      triplets.compact
    end
  end

  private

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  public

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a < b && b < c && a**2 + b**2 == c**2
  end
end
