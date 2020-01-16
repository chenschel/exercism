module IsbnVerifier
  FACTORS = (1..10).to_a.reverse.freeze

  class << self
    def valid?(isbn)
      return false if invalid_isbn?(isbn)

      digits = parse_isbn(isbn)
      return false if invalid_size?(digits)

      digits = prepare_digits(digits)
      digits = zip_with_factors(digits)
      digits.sum { |value, factor| value * factor }
            .modulo(11)
            .zero?
    end

    private

    def parse_isbn(isbn)
      isbn.scan(/\w/)
    end

    def prepare_digits(digits)
      if digits.last == 'X'
        digits.pop
        digits.push(10)
      end
      digits.map(&:to_i)
    end

    def zip_with_factors(digits)
      digits.zip(FACTORS)
    end

    def invalid_isbn?(isbn)
      isbn[0...-1].scan(/[[:alpha:]]/).size.positive?
    end

    def invalid_size?(digits)
      digits.size != 10
    end
  end
end
