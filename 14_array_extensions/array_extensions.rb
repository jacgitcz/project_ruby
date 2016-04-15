class Array
	def sum
		if self.length == 0
			result = 0
		else
			total = 0
			self.each {|value| total += value}
			result = total
		end
		result
	end

	def square
		if self.length == 0
			self
		else
			self.map {|n| n*n}
		end
	end

	def square!
		if self.length == 0
			self
		else
			self.map! {|n| n*n}
		end
	end
end