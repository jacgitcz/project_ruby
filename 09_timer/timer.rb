class Timer
	def initialize
		@seconds = 0
	end

	def seconds
		@seconds
	end

	def seconds=(new_secs)
		@seconds = new_secs
	end

	def time_string
		secs = @seconds % 60
		mins = (@seconds - secs) / 60
		mins = mins % 60
		hours = (@seconds - secs - mins * 60) / 3600
		result = padded(hours) + ':' + padded(mins) + ':' + padded(secs)
		result
	end

	def padded(number)
		num_str = number.to_s
		if num_str.length == 1
			num_str = '0' + num_str
		else
			num_str
		end
	end
end