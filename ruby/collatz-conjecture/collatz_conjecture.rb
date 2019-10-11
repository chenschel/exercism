class CollatzConjecture
  class << self
    def steps(number)
      raise ArgumentError unless number.positive?

      counter = 0

      while number > 1
        if number.even?
          number /= 2
        else
          number = (number * 3) + 1
        end
        counter += 1
      end

      counter
    end
  end
end
