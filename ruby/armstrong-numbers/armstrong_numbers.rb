require 'byebug'
class ArmstrongNumbers
  class << self
    def include?(number)
      exponent = nil
      result = number.to_s
                     .chars
                     .tap { | chracters| exponent = chracters.length }
                     .map { |num| (num.to_i) ** exponent }
                     .sum

      result == number
    end
  end
end
