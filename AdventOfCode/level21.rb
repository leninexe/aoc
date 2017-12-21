def printPattern(pattern)
	y = 0

	print "\n"

	while y < pattern.length
		x = 0

		while x < pattern[y].length
			print pattern[y][x]

			x += 1
		end

		print "\n"

		y += 1
	end

	print "\n"
end

def hasMatch(array, pattern, x, size)
	i = 0
	check = pattern[0]

	while i < 4
		rot = []

		if size == 2 then
			# normal
			if array[0][x, size] == check[0] && array[1][x, size] == check[1] then
				return true
			end

			# x flip
			if array[0][x, size].reverse == check[0] && array[1][x, size].reverse == check[1] then
				return true
			end

			# y flip
			if array[0][x, size] == check[1] && array[1][x, size] == check[0] then
				return true
			end

			# xy flip
			if array[0][x, size].reverse == check[1] && array[1][x, size].reverse == check[0] then
				return true
			end

			rot[0] = check[1][0] + check[0][0]
			rot[1] = check[1][1] + check[0][1]
		elsif size == 3 then
			# normal
			if array[0][x, size] == check[0] && array[1][x, size] == check[1] && array[2][x, size] == check[2] then
				return true
			end

			# x flip
			if array[0][x, size].reverse == check[0] && array[1][x, size].reverse == check[1] && array[2][x, size].reverse == check[2] then
				return true
			end

			# y flip
			if array[0][x, size] == check[2] && array[1][x, size] == check[1] && array[2][x, size] == check[0] then
				return true
			end

			# xy flip
			if array[0][x, size].reverse == check[2] && array[1][x, size].reverse == check[1] && array[2][x, size].reverse == check[0] then
				return true
			end

			rot[0] = check[2][0] + check[1][0] + check[0][0]
			rot[1] = check[2][1] + check[1][1] + check[0][1]
			rot[2] = check[2][2] + check[1][2] + check[0][2]
		end

		check = rot
		i += 1
	end

	false
end

def combineSectors(sectors, size)
	result = []

	i = 0
	x = 0

	p sectors

	while i < sectors.length
		if size == 3 then
			result[i*4] = ""
			result[i*4+1] = ""
			result[i*4+2] = ""
			result[i*4+3] = ""

			sectors[i].each_index do |j|
				result[i*4] += sectors[i][j][0]
				result[i*4+1] += sectors[i][j][1]
				result[i*4+2] += sectors[i][j][2]
				result[i*4+3] += sectors[i][j][3]
			end
		elsif size == 2 then
			result[i*3] = ""
			result[i*3+1] = ""
			result[i*3+2] = ""

			sectors[i].each_index do |j|
				result[i*3] += sectors[i][j][0]
				result[i*3+1] += sectors[i][j][1]
				result[i*3+2] += sectors[i][j][2]
			end
		end

		i += 1
	end

	result
end

lines = ARGF.read.strip.split("\n")
rules = Array.new

lines.each do |l|
	parts = l.split("=>")
	pattern = parts[0].strip.split("/")
	replace = parts[1].strip.split("/")
	rules << [pattern, replace]
end

iterations = 0
size = 3
pattern = [".#.", "..#", "###"]

printPattern(pattern)

# Part 1 -> 5 iterations
#while iterations < 5

# Part 2 -> 18 iterations
while iterations < 18
	if size % 2 == 0 then
		ysectors = []
		y = 0

		while y < pattern.length
			xsectors = []
			x = 0
			sub = pattern[y, 2]

			p "#{iterations}: #{sub}"

			while x < pattern[y].length
				rules.select{ |r| r[0].length == 2}.each do |r|
					if hasMatch(sub, r, x, 2) then
						xsectors << [r[1][0][0] + r[1][0][1] + r[1][0][2], r[1][1][0] + r[1][1][1] + r[1][1][2], r[1][2][0] + r[1][2][1] + r[1][2][2]]
						break
					end
				end

				x += 2
			end

			ysectors << xsectors

			y += 2
		end

		pattern = combineSectors(ysectors, 2)
		printPattern(pattern)
	elsif size % 3 == 0 then
		ysectors = []
		y = 0

		while y < pattern.length 
			xsectors = []
			x = 0
			sub = pattern[y, 3]

			while x < pattern[y].length				
				rules.select{ |r| r[0].length == 3}.each do |r|
					if hasMatch(sub, r, x, 3) then
						xsectors << [r[1][0][0] + r[1][0][1] + r[1][0][2] + r[1][0][3], r[1][1][0] + r[1][1][1] + r[1][1][2] + r[1][1][3], r[1][2][0] + r[1][2][1] + r[1][2][2] + r[1][2][3], r[1][3][0] + r[1][3][1] + r[1][3][2] + r[1][3][3]]
						break
					end
				end

				x += 3
			end

			ysectors << xsectors

			y += 3
		end

		pattern = combineSectors(ysectors, 3)
		printPattern(pattern)
	end

	size = pattern.length
	iterations += 1
end

count = 0

pattern.each do |pp|
	pp.each_char{ |c| if c == "#" then count += 1 end }
end

p count