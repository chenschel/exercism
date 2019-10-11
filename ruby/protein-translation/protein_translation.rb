require 'byebug'

class Translation
  PROTEINS = { AUG: 'Methionine',
               UUU: 'Phenylalanine',
               UUC: 'Phenylalanine',
               UUA: 'Leucine',
               UUG: 'Leucine',
               UCU: 'Serine',
               UCC: 'Serine',
               UCA: 'Serine',
               UCG: 'Serine',
               UAU: 'Tyrosine',
               UAC: 'Tyrosine',
               UGU: 'Cysteine',
               UGC: 'Cysteine',
               UGG: 'Tryptophan',
               UAA: 'STOP',
               UAG: 'STOP',
               UGA: 'STOP' }.freeze
  class << self
    def of_codon(codon)
      PROTEINS.fetch(codon.to_sym) { raise InvalidCodonError }
    end

    def of_rna(strand)
      strand.scan(/[[:alpha:]]{3}/)
            .map { |rna| of_codon(rna) }
            .take_while { |protein| protein != 'STOP' }
    end
  end
end

class InvalidCodonError < StandardError; end
