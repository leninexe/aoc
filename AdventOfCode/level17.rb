#steps = 3
steps = 312
buffer = [0]
i = 0
pos = 0

# Part 1
#while i < 2017 do
#	pos = (pos + steps) % buffer.length
#	buffer.insert(pos + 1, i + 1)
#	pos += 1
#	i += 1
#end

#p buffer

# Part 2
i = 0
pos = 0
length = 1
b1 = -1

while i < 50000000
	pos = (pos + steps) % length + 1
	length += 1
	i += 1

	if pos == 1 then
		b1 = i
	end
end

p b1