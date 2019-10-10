class Grains
  MAX_SQUARES = 64
  
  def self.square(num)
    raise ArgumentError unless (1..MAX_SQUARES).include?(num)
    2 ** (num - 1)
  end

  def self.total
    (2 ** MAX_SQUARES) - 1
  end
end
