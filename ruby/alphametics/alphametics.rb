require 'byebug'

class Alphametics
  NUMBERS = (0..9).freeze

  class << self
    private

    def digest_parts(puzzle)
      # ignore + and ==
      puzzle.scan(/\d+/)
    end

    def digest_start_with_zero?(puzzle)
      digest_parts(puzzle).select do |part|
        part.start_with?('0')
      end.any?
    end

    def seperate_result_and_operands(puzzle)
      parts = digest_parts(puzzle)
      # result is always the last element
      [parts.pop, parts]
    end

    def unique_alpha(letters)
      letters.scan(/[[:alpha:]]/).uniq.join
    end

    public

    def solve(puzzle)
      letters = unique_alpha(puzzle)

      NUMBERS.to_a.permutation(letters.length) do |permut|
        translated_puzzle = puzzle.tr(letters, permut.join)
        next if digest_start_with_zero?(translated_puzzle)

        result, operands = seperate_result_and_operands(translated_puzzle)
        if result.to_i == operands.map(&:to_i).sum
          letters_array = letters.chars
          return letters_array.zip(permut).to_h
        end
      end

      {}
    end
  end
end
