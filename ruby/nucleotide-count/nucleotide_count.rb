require 'byebug'

class Nucleotide
  DEFAULT_NUCLEOTIDES = { "A" => 0, "T" => 0, "C" => 0, "G" => 0 }.freeze

  class << self
    def from_dna(sequence)
      raise ArgumentError if sequence.match(/[^ATCG]/)

      @nucleotides = sequence.chars.group_by { |element| element }
      self
    end

    def count(element)
      @nucleotides.fetch(element, []).count
    end

    def histogram
      DEFAULT_NUCLEOTIDES.merge(@nucleotides.map { |key, values| [key, values.count] }.to_h)
    end
  end
end
