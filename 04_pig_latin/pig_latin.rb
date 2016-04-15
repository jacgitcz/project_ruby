def translate(text)
	vowels = "aeiou"
	single_consonants = "bcdfghjklmnpqrstvwxyz"
	words = text.split
	latin = []
	words.each do |word|
		start = word[0]
		if vowels.include?(start)
			new_word = word + "ay"
		else
			start_consonants = ""
			i = 0
			while i < word.length &&  single_consonants.include?(word[i]) do
				if word[i] == "q" && word[i+1] == "u"
					start_consonants += word[i] + word[i+1]
					i += 1
				else
				    start_consonants += word[i]
				end
				i += 1
			end
			new_word = word[start_consonants.length..-1] + start_consonants + "ay"
		end
		latin.push(new_word)
	end
	if latin.length > 1
		result = latin.join(" ")
	else
		result = latin[0]
	end
	result
end