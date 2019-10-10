class Hamming
	def self.compute(seq1, seq2)
		raise ArgumentError if seq1.size != seq2.size

		diff = 0
		
		(0..seq1.size).each do |idx|
			diff += 1 if seq1[idx] != seq2[idx]
		end	

		diff
	end
end
