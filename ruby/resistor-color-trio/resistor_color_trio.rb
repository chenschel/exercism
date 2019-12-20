require 'byebug'
class ResistorColorTrio
  COLORS = { black: 0,
             brown: 1,
             red: 2,
             orange: 3,
             yellow: 4,
             green: 5,
             blue: 6,
             violet: 7,
             grey: 8,
             white: 9 }.freeze

  def initialize(colors)
    @colors = parse(colors)
  end

  def label
    "Resistor value: #{transform}"
  end

  private

  def parse(colors)
    colors.map do |color|
      raise ArgumentError unless COLORS.keys.include?(color.to_sym)

      COLORS[color.to_sym]
    end
  end

  def transform
    first, second, third = @colors
    colors = "#{first}#{second}#{'0' * third}".to_i

    return "#{colors / 1_000} kiloohms" if colors >= 1_000

    "#{colors} ohms"
  end
end
