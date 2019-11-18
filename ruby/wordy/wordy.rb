class WordProblem
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def answer
    eval(parse_exercise)
  rescue SyntaxError, NameError
    raise ArgumentError
  end

  def parse_exercise
    case phrase
    when /\AWhat is /
      exersice_helper(replace: 'What is ')
    when /\?/
      exersice_helper(replace: '?')
    when /plus/
      exersice_helper(replace: 'plus', with: '+')
    when /minus/
      exersice_helper(replace: 'minus', with: '-')
    when /multiplied by/
      exersice_helper(replace: 'multiplied by', with: '*')
    when /divided by/
      exersice_helper(replace: 'divided by', with: '/')
    when /raised to the/
      exersice_helper(replace: 'raised to the', with: '**')
      exersice_helper(replace: /(st|nd|rd|th) power/)
    else
      return phrase
    end
    parse_exercise
  end

  def exersice_helper(replace:, with: '')
    phrase.gsub!(replace, with)
  end
end
