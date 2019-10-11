class Pangram
  class << self
    def pangram?(phrase)
      character_count = phrase.downcase.scan(/[[:alpha:]]/).uniq.size

      character_count == 26
    end
  end
end
