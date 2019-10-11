class ResistorColorDuo
  COLORS = { black: '0',
             brown: '1',
             red: '2',
             orange: '3',
             yellow: '4',
             green: '5',
             blue: '6',
             violet: '7',
             grey: '8',
             white: '9' }

  class << self
    def value(colors)
      colors.first(2).map do |color|
        color_value(color)
      end.join.to_i
    end

    private

    def color_value(color)
      key = color.downcase.to_sym
      COLORS[key]
    end
  end
end
