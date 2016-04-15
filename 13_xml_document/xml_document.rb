class XmlDocument
	def initialize(indent=false)
		@indent = indent
		@indent_level = 0
	end

	def method_missing(m, *args, &block)
		attrib_str = ""
		if args.length > 0
			attrib = args[0]
			if attrib.is_a?(Hash)
				key = attrib.keys[0]
				name = key.to_s
				value = attrib[key]
				attrib_str = " " +name + "=" + "'" +value + "'"
			end
		end
		if block == nil
		    tag = "<" + m.to_s + attrib_str + "/>"
		    if @indent
		    	tag = "  "*@indent_level + tag + "\n"
		    end
		else
			opentag = "<" + m.to_s + attrib_str + ">"
			closetag = "</" + m.to_s + ">"
			if @indent
				opentag = "  "*@indent_level + opentag + "\n"
			end
			@indent_level += 1
			content = block.call.to_s
			@indent_level -= 1
			tag =  opentag  + content
			if @indent
			    closetag = "  "*@indent_level + closetag + "\n"
			end
			tag += closetag
		end
		tag
	end
end