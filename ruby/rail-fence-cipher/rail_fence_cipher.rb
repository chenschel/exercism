require 'byebug'

class RailFenceCipher
  class << self
    def encode(string, rails)
      rails_array = (0..(rails - 1)).to_a
                                   .each_with_object([]) { |rail, array| array << [] }

      string.chars
            .map
            .with_index { |char, index| rails_array[index % rails] << char }

      byebug

      rails_array.reduce(&:+)
                 .join
    end
  end
end
