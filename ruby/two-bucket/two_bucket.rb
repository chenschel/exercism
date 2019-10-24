require 'byebug'

class TwoBucket
  attr_reader :liters_to_reach, :bucket_one, :bucket_two

  private

  def initialize(size_bucket_one, size_bucket_two, liters_to_reach, fill_first)
    @liters_to_reach = liters_to_reach
    @bucket_one = Bucket.new(size_bucket_one)
    @bucket_two = Bucket.new(size_bucket_two)
    fill_first == 'one' ? bucket_one.fill_up : bucket_two.fill_up

    solve
  end

  def solve
    return if solved?

    if bucket_one.full?
      bucket_two.swap(bucket_one)
    elsif bucket_two.full?
      bucket_one.swap(bucket_two)
    end

    if bucket_one.full?
      bucket_one.empty
    elsif bucket_two.full?
      bucket_two.empty
    end

    solve
  end

  def solved?
    @bucket_one.amount == liters_to_reach || @bucket_two.amount == liters_to_reach
  end

  public

  def moves
  end

  def goal_bucket
  end

  def other_bucket
  end
end

class Bucket
  attr_reader :volume, :amount

  private

  def initialize(volume)
    @volume = volume
    @amount = 0
  end

  public

  def empty?
    amount.zero?
  end

  def empty
    tmp = amount
    @amount = 0
    tmp
  end

  def full?
    amount == volume
  end

  def free_space
    volume - amount
  end

  def fill(liter)
    @amount += liter

    raise ArgumentError, 'not enough space' if amount > volume
  end

  def fill_up
    @amount = volume
  end

  def pour(liter)
    @amount -= liter

    raise ArgumentError, 'not enough space' if amount.negative?
  end

  # @param other [Bucket]
  def swap(other)
    liquit = if free_space >= other.amount
               other.amount
             else
               free_space
             end
    fill(liquit)
    other.pour(liquit)
  end
end
