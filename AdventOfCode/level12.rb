def findStartingPoints(connections, index, visited)
	result = Array.new()
	endpoints = connections[index]

	endpoints.each do |ep|
		if !visited.include?(ep)
			visited.push(ep)
			result.concat(findStartingPoints(connections, ep, visited))
			result.push(ep)
		end
	end	

	return result
end

pipes = ARGF.read.strip.split("\n")
connections = Array.new()

pipes.each do |pipe|
	endpoints = pipe.split("<->")[1].strip.split(",").map(&:to_i)
	connections.push(endpoints)
end

p connections[0]

p findStartingPoints(connections, 0, Array.new()).length

alreadyFound = Array.new()
groups = 0
i = 0

while i < connections.length do
	if !alreadyFound.include?(i) then
		alreadyFound.concat(findStartingPoints(connections, i, Array.new()))
		groups += 1
	end

	i += 1
end

p groups