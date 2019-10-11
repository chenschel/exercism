require 'byebug'

class Brackets
  class << self
    def paired?(phrase)
      bracket_stack = []

      phrase.each_char do |character|
        case character
        when '(', '{', '['
          bracket_stack << character
        when ')'
          return false unless bracket_stack.pop == '('
        when ']'
          return false unless bracket_stack.pop == '['
        when '}'
          return false unless bracket_stack.pop == '{'
        end
      end

      bracket_stack.size == 0
    end
  end
end
