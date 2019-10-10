require 'pry'

class BeerSong
  attr_reader :current_bottle, :next_bottle
  def verse(bottles)
      @bottles = bottles
      prepare_helpers
      sentences
  end

  def verses(start_verse, end_verse)
    result = []
    (end_verse..start_verse).to_a.reverse.each do |bottle| 
      result << verse(bottle) 
    end
    result.join("\n")
  end

  def sentences
    <<-TEXT
#{sentence_one}
#{sentence_two}
TEXT
  end

  def sentence_one
    "#{current_label} #{bottles_label{ @bottles }} of beer on the wall, #{current_label.downcase} #{bottles_label{ @bottles }} of beer."
  end

  def sentence_two
    return alternative if @bottles == 0
    "Take #{take_label} down and pass it around, #{next_label} #{bottles_label{ next_bottle }} of beer on the wall."
  end

  private

  def prepare_helpers
    @current_bottle = @bottles.to_s
    @next_bottle = @bottles - 1
  end

  def alternative
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  end

  def bottles_label
    bottle = yield 
    return 'bottle' if bottle == 1
    'bottles'
  end

  def current_label
    return 'No more' if @bottles == 0
    current_bottle
  end

  def take_label
    return take_label = 'it' if @bottles == 1
    'one'
  end

  def next_label
    return 'no more' if next_bottle == 0
    next_bottle
  end
end
