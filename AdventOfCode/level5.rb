instructions = ARGF.read.strip.split("\n").map(&:to_i)
pc = 0
count = 0

while (0...instructions.length).cover?(pc)
	offset = instructions[pc]

#	instructions[pc] += 1
	offset < 3 ? instructions[pc] += 1 : instructions[pc] -= 1

	pc += offset
	count += 1
end

p count