def printMap(map)
	p "+#{Array.new(map.length,'-').join}+"
	map.each{ |l| p "|#{l}|" }
	p "+#{Array.new(map.length,'-').join}+"
end

map = ARGF.read.strip.split("\n")
direction = 0 #0 up, 1 right, 2 down, 3 left
pos = [map[0].length / 2, map.length / 2]
turns = 0
infectionBursts = 0

printMap(map)

# Part 1 only clean and infected (10000 bursts)
# Part 2 also weakened and flagged nodes (10000000 bursts)

while turns < 10000000
	current = map[pos[1]][pos[0]]

#	if current == "." then
#		#clean
#		direction = (direction - 1) % 4
#		map[pos[1]][pos[0]] = "#"
#
#		infectionBursts += 1
#	elsif current == "#" then
#		#infected
#		direction = (direction + 1) % 4
#		map[pos[1]][pos[0]] = "."
#	end

	if current == "." then
		# clean
		direction = (direction - 1) % 4
		map[pos[1]][pos[0]] = "W"
	elsif current == "W" then
		# weakened
		map[pos[1]][pos[0]] = "#"

		infectionBursts += 1
	elsif current == "#" then
		# infected
		direction = (direction + 1) % 4
		map[pos[1]][pos[0]] = "F"
	elsif current == "F" then
		# flagged
		direction = (direction + 2) % 4
		map[pos[1]][pos[0]] = "."
	end

	if direction == 0 then
		pos[1] -= 1
	elsif direction == 1 then
		pos[0] += 1
	elsif direction == 2 then
		pos[1] += 1
	elsif direction == 3 then
		pos[0] -= 1
	end

	if pos[1] < 0 || pos[1] >= map.length || pos[0] < 0 || pos[0] >= map[0].length then
		map.insert(0, Array.new(map[0].length, ".").join)
		map << Array.new(map[0].length, ".").join
		map.map!{|l| l = "." + l + "."}
		pos.map!{|v| v += 1}
	end

#	p pos
#	p direction
#	printMap(map)

	turns += 1
end

p infectionBursts