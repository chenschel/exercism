require 'byebug'

class RotationalCipher
  CAPITAL_START = 65
  CAPITAL_END = 91
  CAPITAL = CAPITAL_START...CAPITAL_END
  LOWER_START = 97
  LOWER_END = 123
  LOWER = LOWER_START...LOWER_END

  class << self
    def rotate(phrase, shifter)
      @shifter = shifter

      phrase.bytes.map do |bts|
        calc(bts)
      end.pack('c*')
    end

    private

    def calc(bts)
      return calc_lower(bts) if LOWER.cover?(bts)
      return calc_capital(bts) if CAPITAL.cover?(bts)

      bts
    end

    def calc_capital(bts)
      tmp_result = bts + @shifter
      tmp_result = CAPITAL_START + (tmp_result % CAPITAL_END) if tmp_result.div(CAPITAL_END).positive?
      tmp_result
    end

    def calc_lower(bts)
      tmp_result = bts + @shifter
      tmp_result = LOWER_START + (tmp_result % LOWER_END) if tmp_result.div(LOWER_END).positive?
      tmp_result
    end
  end
end
