class Fixnum
	def in_words
		case self
		when 0..99
			decode_hundreds(self,true)
		when 100..999
			decode_hundreds(self)
		else
			powers = ['thousand','million','billion','trillion']
			value_left = self
			i = 0
			num_list = []
			while value_left > 0 do
			    quotient = value_left / 1000				
				remainder = value_left % 1000
				num_list.push(decode_hundreds(remainder))
				value_left = quotient
				i += 1
			end

			for i in 1..(num_list.length - 1) do
				if num_list[i].length > 0
					num_list[i] += " " + powers[i-1]
				end
			end
			num_list.reverse!
			num_list.select! {|item| item.length > 0}
			num_str = num_list.join(" ")
			num_str.strip!
			num_str
		end
	end

	private

	def decode_0_99(number,return_zero)
		units = ['zero','one','two','three','four','five','six','seven','eight','nine']
		low_tens = ['ten','eleven','twelve']
		teens = ['thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
		twenty_to_ninety = ['twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
		case number
		when 0
		    if return_zero
		        result = units[number]
		    else
		    	result = ""
		    end
		when 1..9
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

	def decode_hundreds(number, return_zero=false)
		units = ['zero','one','two','three','four','five','six','seven','eight','nine']
		hundreds_val = number / 100
		remainder = number % 100
		if hundreds_val > 0
			result = units[hundreds_val] + " hundred"
		else
			result = ""
		end
		rem_str = decode_0_99(remainder,return_zero)
		if result.length > 0
			if rem_str.length > 0
				result += " " + rem_str
			end
		else
			result = decode_0_99(remainder,return_zero)
		end
		result.to_s
	end
end

	