class Triangle
  attr_reader :abc

  def initialize(abc)
    @abc = abc
  end

  def equilateral?
    triangle_rules? { |size| size == 1 }
  end

  def isosceles?
    triangle_rules? { |size| size <= 2 }
  end

  def scalene?
    triangle_rules? { |size| size == 3 }
  end

  private

  def triangle_rules?
    all_positive? && length_rule? && yield(abc.uniq.size)
  end

  def all_positive?
    abc.all?(&:positive?)
  end

  def length_rule?
    sides = abc.sort
    max = sides.pop

    max <= sides.sum
  end
end
