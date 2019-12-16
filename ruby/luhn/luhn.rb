class Luhn
  class << self
    def valid?(input)
      input.gsub!(/\s/, '')
      return false if input_invalid?(input)

      (calc_sum(input) % 10).zero?
    end

    private

    def calc_sum(input)
      input.scan(/\d/)
           .reverse
           .map(&:to_i)
           .map.with_index(&method(:luhn_first_step))
           .sum
    end

    def luhn_first_step(digit, index)
      if index.odd?
        digit *= 2
        digit -= 9 if digit > 9
      end
      digit
    end

    def input_invalid?(input)
      (0..1).cover?(input.length) ||
        input.scan(/\D/).any?
    end
  end
end
