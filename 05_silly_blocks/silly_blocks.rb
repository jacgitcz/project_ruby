def reverser(&block)
	text = block.call
	words = text.split
	result = []
	words.each do |word|
		result.push(word.reverse)
	end
	final_result = result.join(" ")
end

def adder(increment=1, &block)
	value = block.call
	value + increment
end

def repeater(repeat=1)
	repeat.times {yield}
end
