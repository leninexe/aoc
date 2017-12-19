lines = ARGF.read.split("\n")

direction = 2 #0 up, 1 right, 2 down, 3 left
x = 0
y = 0
i = 0

result = ""
steps = 0

while i < lines[0].length do
	if lines[0][i] == "|" then
		x = i
		break
	end	

	i += 1
end

p "#{x} - #{y}"

visited = []

while x >= 0 && y >= 0 do
	visited << [x,y]

	if direction == 0 then
		y -= 1
		c = lines[y][x]

		if c == "+" then
			if lines[y][x-1] == "-" then
				direction = 3
			elsif lines[y][x+1] == "-" then
				direction = 1
			end
		elsif c == " " then
			p visited
			p "#{x} #{y}"
			p "result"

			break
		elsif c != "|" && c != "-" then
			p "Letter #{c}"
			result += c
		end
	elsif direction == 1 then
		x += 1
		c = lines[y][x]

		if c == "+" then
			if lines[y-1][x] == "|" then
				direction = 0
			elsif lines[y+1][x] == "|" then
				direction = 2
			end
		elsif c == " " then
			p visited
			p "#{x} #{y}"
			p "result"

			break
		elsif c != "|" && c != "-" then
			p "Letter #{c}"
			result += c
		end
	elsif direction == 2 then
		y += 1
		c = lines[y][x]

		if c == "+" then
			if lines[y][x-1] == "-" then
				direction = 3
			elsif lines[y][x+1] == "-" then
				direction = 1
			end
		elsif c == " " then
			p visited
			p "#{x} #{y}"
			p "result"

			break
		elsif c != "|" && c != "-" then
			p "Letter #{c}"
			result += c
		end
	elsif direction == 3 then
		x -= 1
		c = lines[y][x]

		if c == "+" then
			if lines[y-1][x] == "|" then
				direction = 0
			elsif lines[y+1][x] == "|" then
				direction = 2
			end

			if visited.include?([x,y]) then
				break
			end
		elsif c == " " then
			p visited
			p "#{x} #{y}"
			p "result"

			break
		elsif c != "|" && c != "-" then
			p "Letter #{c}"
			result += c
		end
	end
	
	steps += 1
end

p result
p steps