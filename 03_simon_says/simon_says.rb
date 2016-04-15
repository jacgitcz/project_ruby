def echo(phrase)
	phrase
end

def shout(phrase)
	phrase.upcase
end

def repeat(phrase, count=1)
	extra = " " + phrase
	if count == 1
		phrase + extra
	else
		phrase + extra *(count - 1)
	end
end

def start_of_word(word, count)
	if count >= word.length
		result = word
	else
		result = word[0..(count-1)]
	end
	result
end

def first_word(sentence)
	sentence.split[0]
end

def titleize(phrase)
	words = phrase.split
	result = words[0].capitalize
	words.shift
	little_words = ["the", "and", "a", "over"]
	words.each do |word|
		if little_words.include?(word)
			result += " " + word
		else
			result += " " + word.capitalize
		end
	end
	result
end
