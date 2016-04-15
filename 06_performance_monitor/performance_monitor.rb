def measure(repeat=1)
	start = Time.now
	repeat.times {yield}
	finish = Time.now
	diff = finish - start
	if repeat > 1
		diff/repeat
	else
		diff
	end
end