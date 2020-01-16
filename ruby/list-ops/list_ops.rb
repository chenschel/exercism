module ListOps
  class << self
    def arrays(an_array)
      result = 0
      an_array.each { result += 1 }
      result
    end

    def reverser(an_array)
      return an_array if arrays(an_array).zero?

      reversed = []
      an_array.each { |value| reversed.unshift(value) }
      reversed
    end

    def concatter(first, second)
      first + second
    end

    def mapper(an_array)
      return an_array unless block_given?

      mapped = []
      an_array.each { |item| mapped << yield(item) }
      mapped
    end

    def filterer(an_array)
      return an_array unless block_given?

      mapped = []
      an_array.each { |item| mapped << item if yield(item) }
      mapped
    end

    def sum_reducer(an_array)
      result = 0
      an_array.each { |item| result += item }
      result
    end

    def factorial_reducer(an_array)
      result = 1
      an_array.each { |item| result *= item }
      result
    end
  end
end
