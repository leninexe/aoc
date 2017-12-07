current = ARGF.read.strip.split("\t").map(&:to_i)
solutions = [current]
duplicate = false

while true
	current = current.map do |i| i.dup end
	pop = current.max
	recycle = current.find_index(pop)
	current[recycle] = 0

	while pop > 0
		recycle = (recycle + 1) % current.length
		current[recycle] += 1
		pop -= 1
	end

	if solutions.include? current
		p solutions.length
		p solutions.length - solutions.find_index(current)
		break
	else 
		solutions.push(current)
	end
end