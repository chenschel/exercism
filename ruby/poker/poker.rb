require 'byebug'

class Poker
  attr_reader :hands_of_cards

  def initialize(hands_of_cards)
    @hands_of_cards = []
    init_hands_of_cards(hands_of_cards)
  end

  def best_hand
    best_hands = @hands_of_cards.group_by(&:rank)
                                .to_a
                                .max_by { |(rank, _)| rank }.last
    if best_hands.all? { |hand| hand.rank == :two_pairs }

    else
      [best_hands.max_by(&:highest_card)
                 .yield_self(&:cards)
                 .map(&:to_s)]
    end
  end

  private

  def init_hands_of_cards(hands_of_cards)
    hands_of_cards.each do |cards|
      hand = Hand.new
      cards.each do |card|
        hand.add(card)
      end
      hand.rate
      @hands_of_cards << hand
    end
  end
end

class Hand
  RANKINGS = { high_card: 1,
               pair: 2,
               two_pairs: 3,
               three_of_a_kind: 3,
               straight: 4,
               flush: 5,
               full_house: 6,
               four_of_a_kind: 7,
               straight_flush: 8,
               royal_flush: 9 }.freeze

  attr_reader :cards

  def initialize
    @cards = []
  end

  def add(card)
    parsed_card = card.scan(/\A([1-9]|10|J|Q|K|A)(H|S|C|D)\z/).flatten
    @cards << Card.new(*parsed_card)
  end

  def rate
    @rate = :high_card if high_card?
    @rate = :pair if pair?
    @rate = :two_pairs if two_pairs?
  end

  def rank
    RANKINGS[@rate]
  end

  def highest_card
    @cards.max_by(&:value)
  end

  def to_s
    @cards.map(&:to_s)
  end

  private

  def high_card?
    @cards.group_by(&:value).size == 5 # all values are differend
  end

  def pair?
    @cards.group_by(&:value).size == 4
  end

  def two_pairs?
    @cards.group_by(&:value).size == 3
  end
end

class Card
  IMAGES = { J: 11,
             Q: 12,
             K: 13,
             A: 14 }.freeze

  attr_reader :value, :color, :original

  def initialize(value, color)
    @original = "#{value}#{color}"
    @value = value.gsub(/[[:alpha:]]/) { |alpha| IMAGES[alpha.to_sym] }
               .to_i
    @color = color
  end

  def to_s
    original
  end

  def <=>(other)
    value <=> other.value
  end
end
