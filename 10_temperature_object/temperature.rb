class Temperature
	def initialize(options={})
		if options
			@temps = options
			if options.keys.include?(:f)
				@temps[:c] = Temperature.ftoc(options[:f])
			elsif options.keys.include?(:c)
				@temps[:f] = Temperature.ctof(options[:c])
		    end
	    end
	end

	def self.from_celsius(celsius)
		Temperature.new(c: celsius)
	end

	def self.from_fahrenheit(fahr)
		Temperature.new(f: fahr)
	end

	def self.ftoc(fahr)
		celsius = (fahr - 32) * 5.0 / 9.0
		celsius
	end

	def self.ctof(celsius)
		fahr = celsius * 9.0 / 5.0 + 32.0
		fahr
	end

	def in_celsius
		@temps[:c]
	end

	def in_fahrenheit
		@temps[:f]
	end
end

class Celsius < Temperature
	def initialize(celsius)
	   super(c: celsius)
	end
end

class Fahrenheit < Temperature
	def initialize(fahr)
		super(f: fahr)
	end
end