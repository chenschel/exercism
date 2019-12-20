require 'byebug'
class BaseConverter
  class << self
    def convert(input_base, digits, output_base)
      raise_error_on_invalid_input(input_base, digits, output_base)

      converted_digits = digits.reverse
                               .each_with_index
                               .each_with_object([]) do |(digit, index), arr|
        arr << digit * input_base ** index
      end

      convert_by_output_base(converted_digits, output_base).reverse
    end

    private

    def convert_by_output_base(converted_digits, output_base)
      value = converted_digits.sum
      result = []

      loop do
        new_value, rest = value.divmod(output_base)
        result << rest
        value = new_value
        return result if value.zero?
      end
    end

    def raise_error_on_invalid_input(input_base, digits, output_base)
      raise ArgumentError if bases_invalid?(input_base, output_base) || digits_invalid?(digits, input_base)
    end

    def bases_invalid?(input, output)
      (0..1).cover?(input) ||
        input.negative? ||
        (0..1).cover?(output) ||
        output.negative?
    end

    def digits_invalid?(digits, input_base)
      digits.any?(&:negative?) ||
        digits.any? { |digit| digit >= input_base }
    end
  end
end
