class Fixnum
	def in_words
		units = ['zero','one','two','three','four','five','six','seven','eight','nine']
		case self
		when 0..99
			decode_0_99(self)		
		when 100..999
			decode_hundreds(self)
		when 1000..999999
			decode_thousands(self)
		when 1000000..999999999
			decode_millions(self)
		when 1_000_000_000..999_999_999_999
			decode_billions(self)
		when 1_000_000_000_000..999_999_999_999_999
			decode_trillions(self)
		end
	end

	private

	def decode_0_99(number)
		units = ['zero','one','two','three','four','five','six','seven','eight','nine']
		low_tens = ['ten','eleven','twelve']
		teens = ['thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
		twenty_to_ninety = ['twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
		case number
			when 0..9
			result = units[number]
		when 10..12
			result = low_tens[number - 10]
		when 13..19
			result = teens[number - 13]
		when 20..99
			tens_value = (number / 10)
			units_value = number % 10
			result = twenty_to_ninety[tens_value - 2]
			if units_value > 0
				result += " " + units[units_value]
			end
		end
		result.to_s
	end

	def decode_hundreds(number)
		units = ['zero','one','two','three','four','five','six','seven','eight','nine']
		hundreds_val = number / 100
		remainder = number % 100
		if hundreds_val > 0
			result = units[hundreds_val] + " hundred"
		else
			result = ""
		end
		if remainder > 0
			if result.length > 0
				result += " " + decode_0_99(remainder)
			else
				result = decode_0_99(remainder)
			end
		end
		result.to_s
	end

	def decode_thousands(number)
		result = decode_thousand_plus(number, 1000, "thousand")
		result
	end

	def decode_millions(number)
		result = decode_thousand_plus(number, 1000000, "million")
		result
	end

	def decode_billions(number)
		result = decode_thousand_plus(number, 1_000_000_000, "billion")
		result
	end

	def decode_trillions(number)
		result = decode_thousand_plus(number, 1_000_000_000_000, "trillion")
		result
	end

	def ten_cubed(number, unit_name)
		case number
		when 0
			result = ""
		when 1..99
			result = decode_0_99(number) + " " + unit_name
		when 100..999
			result = decode_hundreds(number) + " " + unit_name
		end
		result
	end

	def decode_remainder(number, result_str)
		if number > 0
			case number
			when 1..99
				rem_str = decode_0_99(number)
			when 100..999
				rem_str = decode_hundreds(number)
			when 1000..999999
				rem_str = decode_thousands(number)
			when 1_000_000..999_999_999
				rem_str = decode_millions(number)
			when 1_000_000_000..999_999_999_999
				rem_str = decode_billions(number)
			end

			if result_str.length > 0
				result_str += " " + rem_str
			else
				result_str = rem_str
			end
		else
			result_str
		end	
		result_str
	end

	def decode_thousand_plus(number, unit_size, unit_name)
		unit_val = number / unit_size
		remainder = number % unit_size
		result = ten_cubed(unit_val, unit_name)
		result = decode_remainder(remainder, result)
		result
	end
end