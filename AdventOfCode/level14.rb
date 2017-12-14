def removeNeighbors(rows,x,y)
	if y > 0 && rows[y - 1][x] == "#" then
		rows[y - 1][x] = "C"
		rows = removeNeighbors(rows, x, y - 1)
	end

	if x > 0 && rows[y][x - 1] == "#" then
		rows[y][x - 1] = "C"
		rows = removeNeighbors(rows, x - 1, y)
	end

	if x < rows[y].length - 1 && rows[y][x + 1] == "#" then
		rows[y][x + 1] = "C"
		rows = removeNeighbors(rows, x + 1, y)
	end

	if y < rows.length - 1 && rows[y + 1][x] == "#" then
		rows[y + 1][x] = "C"
		rows = removeNeighbors(rows, x, y + 1)
	end

	return rows
end

input = ARGF.read.strip
#KNOT HASH

i = 0
used = 0
rows = Array.new()

#while i < 8 do
while i < 128 do
	values = Array(0...256)
	lengths = "#{input}-#{i}".bytes
	lengths.push(17, 31, 73, 47, 23)

	rd = 0
	pos = 0
	skip = 0

	#while rd < 1 do
	while rd < 64 do
		lengths.each do |l|
			subarr = values[pos, l]

			if subarr.length < l then
				subarr.concat(values[0, l - subarr.length])
			end

			subarr.reverse!

			if pos + l < values.length then
				values[pos, l] = subarr
			else
				remainder = pos + l - values.length
				values[pos, pos + l - remainder] = subarr[0, l - remainder]
				values[0, remainder] = subarr[l - remainder, remainder]
			end

			#p pos
			#p l
			#p skip
			#p values

			pos += l + skip
			pos %= values.length
			skip += 1
		end

		rd += 1
	end

	#sparse hash to dense hash

	j = Array(0...16) 
	densehash = Array.new()

	j.each do |c|
		subarr = values[c*16, 16]
		v = 0

		subarr.each{|x|v = v^x}
		densehash.push(v)
	end

	rowvalue = ""
	binary = ""
	densehash.each{|x| rowvalue += "%02x"%x}
	rowvalue.each_char{|c| binary += "%04b"%c.hex}
	binary.each_char{|c| if c == "1" then used += 1 end}
	rows.push(binary.gsub!("1","#").gsub!("0","."))

	i += 1
end

p used
#rows.each{|r| p r}

# Part 2
region = 0
y = 0

while y < 128 do
	x = 0

	while x < 128 do
		if rows[y][x] == "#" then
			rows[y][x] = "C"
			rows = removeNeighbors(rows,x,y)
			region += 1
		end
		x += 1
	end

	y += 1
end

rows.each{|r| p r}
p region