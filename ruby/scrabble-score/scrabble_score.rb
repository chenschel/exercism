class Scrabble
  def initialize(word)
    @letters = word.nil? ? [] : word.upcase.gsub(/\s+/, '').split('')
    @result = [0]
  end

  def self.score(word)
    new(word).score
  end

  def score
    calculate unless @letters.count.zero?
    @result.sum
  end

  private

  def calculate
    raise LetterError, "Given word can't be calculated: #{@letters.join}" unless /^[A-Z]+$/.match(@letters.join)

    @result = @letters.map do |letter|
      case letter
        when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
        when 'D', 'G' then 2
        when 'B', 'C', 'M', 'P' then 3
        when 'F', 'H', 'V', 'W', 'Y' then 4
        when 'K' then 5
        when 'J', 'X' then 8
        when 'Q', 'Z' then 10
      end
    end
  end
end

class LetterError < StandardError; end