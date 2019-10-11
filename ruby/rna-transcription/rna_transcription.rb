class Complement
  RNAS = { 'G' => 'C',
           'C' => 'G',
           'T' => 'A',
           'A' => 'U' }.freeze

  class << self
    def of_dna(dnas)
      dnas.chars.map do |dna|
        RNAS.fetch(dna, '')
      end.join
    end
  end
end
