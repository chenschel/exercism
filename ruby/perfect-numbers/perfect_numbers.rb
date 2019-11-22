require 'byebug'

class PerfectNumber
  class << self
    def classify(num)
      raise RuntimeError unless num.positive?

      result = (1...num).select { |divisor| (num % divisor).zero? }.sum

      case result <=> num
      when 0
        'perfect'
      when -1
        'deficient'
      when 1
        'abundant'
      else
        raise StandardError, "#{num} can't be classified"
      end
    end
  end
end
