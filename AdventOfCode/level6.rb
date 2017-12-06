current = ARGF.read.strip.split("\t").map(&:to_i)
solutions = [current]
duplicate = false

count = 0
cycles = 0

while !duplicate
	count += 1
	max = 0
	current = current.map do |i| i.dup end
	recycle = -1
	pop = current.max

	current.each_index do |i|
		if current[i] == pop
			current[i] = 0
			recycle = i
			break
		end
	end

	while pop > 0
		recycle += 1
		recycle %= current.length
		current[recycle] += 1
		pop -= 1
	end

	#p current
	if solutions.include? current
		solutions.each_index do |i|
			if solutions[i] == current
				cycles = count - i
				break
			end
		end

		duplicate = true
	else
		solutions.push(current)
	end
end

p count
p cycles