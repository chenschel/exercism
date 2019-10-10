class Integer
  ROMAN_MAP = [[1000, 'M'],
               [900, 'CM'],
               [500, 'D'],
               [400, 'CD'],
               [100, 'C'],
               [90, 'XC'],
               [50, 'L'],
               [40, 'XL'],
               [10, 'X'],
               [9, 'IX'],
               [5, 'V'],
               [4, 'IV'],
               [1, 'I']]
  def to_roman
    value = self
    result = []
    ROMAN_MAP.each do |key, roman|
      times, value = value.divmod(key)
      result << roman * times
    end

    result.join
  end
end
