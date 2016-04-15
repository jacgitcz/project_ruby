class Dictionary
	def initialize
		@entries = {}
	end

	def entries
		@entries
	end

	def keywords
		@entries.keys.sort
	end

	def include?(keyword)
		@entries.has_key?(keyword)
	end

	def find(keyword)
		prefix_len = keyword.length - 1
		result = {}
		@entries.each_pair do |key, value|
			if key[0..prefix_len] == keyword
				result[key] = value
			end
		end
		result
	end

	def printable
		result = ""
		key_list = @entries.keys.sort
		key_list.each do |key|
			value = @entries[key]
			result += '[' + key + '] "' + value.to_s + '"' + "\n" 
		end
		result.chomp!
	end

	def add(item)
		if item.is_a?(Hash)
			@entries.merge!(item)
		elsif item.is_a?(String)
			@entries[item] = nil			
		end
	end
end