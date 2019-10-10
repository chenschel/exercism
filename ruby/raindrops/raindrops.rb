class Raindrops
	def self.convert(number)
		msg = ''
		msg << 'Pling' if number % 3 == 0
		msg << 'Plang' if number % 5 == 0
		msg << 'Plong' if number % 7 == 0
		
		return number.to_s if msg.empty?
		msg
	end
end