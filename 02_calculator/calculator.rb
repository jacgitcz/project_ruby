def add(a,b)
	a + b
end

def subtract(a,b)
	a - b
end

def sum(numbers)
	total = 0
	numbers.each do |number|
		total += number		
	end
	total
end

def multiply(a, b)
	a * b
end

def power(a, b)
	a ** b
end

def factorial(number)
	result = 1
	if number > 1
		for i in 1..number
			result *= i
		end
	end
	result
end