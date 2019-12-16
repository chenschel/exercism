class PhoneNumber
  class << self
    def clean(phone_number)
      numbers = phone_number.scan(/\d/)
      return unless number_length_valid?(numbers)

      numbers.shift if country_code?(numbers)
      return unless area_and_exchange_code_valid?(numbers)

      numbers.join
    end

    private

    def area_and_exchange_code_valid?(numbers)
      exclude?(%w[0 1], numbers.first) &&
        exclude?(%w[0 1], numbers[3])
    end

    def exclude?(arr, number)
      !arr.include?(number)
    end

    def number_length_valid?(numbers)
      numbers.count == 10 ||
        number_length_of_11_valid?(numbers)
    end

    def number_length_of_11_valid?(numbers)
      numbers.count == 11 && numbers.first == '1'
    end

    alias country_code? number_length_of_11_valid?
  end
end
