class RPNCalculator
	def initialize
		@stack = []
	end

	def push(number)
		@stack.push(number)
	end

	def plus
		if @stack.length >= 2
			a = @stack.pop
			b = @stack.pop
			push(a + b)
		else
			raise "calculator is empty"
		end
	end

	def minus
		if @stack.length >= 2
			a = @stack.pop  # second number
			b = @stack.pop
			push(b - a)
		else
			raise "calculator is empty"
		end
	end

	def divide
		if @stack.length >= 2
			a = @stack.pop # dividend
			b = @stack.pop # numerator
			push(b.to_f / a)
		else
			raise "calculator is empty"
		end
	end

	def times
		if @stack.length >= 2
			a = @stack.pop
			b = @stack.pop
			push(b * a)
		else
			raise "calculator is empty"
		end
	end

	def value
		@stack[-1]
	end

	def tokens(calc_str)
		token_array = calc_str.split
		result = []
		token_array.each do |item|
			if "+-*/".include?(item)
				token = item.to_sym
			else
				if item.include?(".")
				    token = item.to_f
				else
					token = item.to_i
				end
			end
			result.push(token)
		end
		result
	end

	def evaluate(calc_str)
		token_list = tokens(calc_str)
		token_list.each do |token|
			case token
			when :+
				plus
			when :-
				minus
			when :*
				times
			when :/
				divide
			else
				push(token)
			end
		end
		value
	end
end