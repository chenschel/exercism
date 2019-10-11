require 'byebug'
class Acronym
  class << self
    def abbreviate(phrase)
      phrase.scan(/\b\w/).join.upcase
    end
  end
end
