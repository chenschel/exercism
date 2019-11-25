class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def match(list_of_words)
    list_of_words.select { |word_to_check| anagram?(word_to_check) }
  end

  private

  def anagram?(word_to_check)
    differend_words?(word_to_check) &&
      same_characters?(word_to_check)
  end

  def differend_words?(word_to_check)
    word_to_check.downcase != word.downcase
  end

  def same_characters?(word_to_check)
    decompose(word_to_check) == decompose(word)
  end

  def decompose(word)
    word.downcase.chars.sort
  end
end
