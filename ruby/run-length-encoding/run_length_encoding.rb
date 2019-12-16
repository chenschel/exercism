class RunLengthEncoding
  class << self
    def encode(input)
      return '' if input.empty?

      input.scan(/(([\w ])\2*)/)
           .map(&:first)
           .map { |characters| encode_characters(characters) }
           .join

      input.gsub(/(.)\1+/) { |match| "#{match.length}#{match[0]}" }
    end

    def decode(input)
      return '' if input.empty?

      input.scan(/([1-9]+[A-Z ]|[A-Z ])/i)
           .flatten
           .map { |elem| decode_characters(elem) }
           .join

      input.gsub(/\d+./) { |match| match[-1] * match.to_i }
    end

    private

    def encode_characters(str)
      characters = str.chars
      characters.length > 1 ? "#{characters.length}#{characters.first}" : characters.first
    end

    def decode_characters(str)
      factor, character = str.partition(/[A-Z ]/i)
      factor = factor.to_i
      factor = factor.zero? ? 1 : factor

      character * factor
    end
  end
end
