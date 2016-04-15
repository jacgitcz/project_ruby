class Book
	def initialize
	   @title = ""
	end

	def title=(new_title)
		non_capitals = ['the','a','an']
		conjunctions = ['and','or']
		prepositions = ['in','on','at','to','from','of','by','with']
		word_list = new_title.split
		word_list.each do |word|
			if !(non_capitals.include?(word)) &&
				!(conjunctions.include?(word)) &&
				!(prepositions.include?(word))
			    word.capitalize!
		    end
		end
		word_list[0].capitalize! # always cap 1st word
		@title = word_list.join(" ")
	end

	def title
		@title
	end
end