=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

module TwelveDays
  GIFTS = [['twelfth', 'twelve Drummers Drumming,'],
           ['eleventh', 'eleven Pipers Piping,'],
           ['tenth', 'ten Lords-a-Leaping,'],
           ['ninth', 'nine Ladies Dancing,'],
           ['eighth', 'eight Maids-a-Milking,'],
           ['seventh', 'seven Swans-a-Swimming,'],
           ['sixth', 'six Geese-a-Laying,'],
           ['fifth', 'five Gold Rings,'],
           ['fourth', 'four Calling Birds,'],
           ['third', 'three French Hens,'],
           ['second', 'two Turtle Doves, and'],
           ['first', "a Partridge in a Pear Tree"]].freeze

  VERSES = (0..(GIFTS.size - 1)).to_a.freeze

  class << self
    def song
      VERSES.each_with_object([]) do |verse, text|
        text << single_verse(verse)
      end.join("\n\n") + "\n"
    end

    private

    def single_verse(number)
      "On the #{ordinal_number(number)} day of Christmas my true love gave to me: #{verse_parts(number)}."
    end

    def ordinal_number(number)
      GIFTS.last(number + 1).first.first
    end

    def verse_parts(number)
      GIFTS.last(number + 1).map(&:last).join(' ')
    end
  end
end
