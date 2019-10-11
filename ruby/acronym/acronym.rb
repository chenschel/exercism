require 'byebug'
class Acronym
  class << self
    def abbreviate2(phrase)
      phrase.scan(/\b\w+\b/).map do |word|
        word.chr.upcase
      end.join
    end

    def abbreviate(phrase)
      phrase.scan(/\b\w/).join.upcase
    end
  end
end
