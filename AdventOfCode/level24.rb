$paths = []

def findBridges(port, parts, path)
	candidates = parts.select{|p| p.split("/")[0].to_i == port || p.split("/")[1].to_i == port}
	#p "#{path}"
	#p "#{port} finds #{candidates}"

	candidates.each do |c|
		remaining = parts.select{|p| p != c}

		if c.split("/")[0].to_i == port then
			findBridges(c.split("/")[1].to_i, remaining, path + [c])
		else
			findBridges(c.split("/")[0].to_i, remaining, path + [c])
		end
	end

	$paths << path
end

lines = ARGF.read.strip.split("\n")

p lines

current = 0

findBridges(0, lines, [])
$paths.select!{|p| p.length > 0}
$paths.sort!{|p1,p2| p2.length - p1.length}

# Part 2
$paths.select!{|p| p.length == $paths[0].length}

max = 0

# Part 1
$paths.each do |p|
	v = 0

	p.each do |part|
		v += part.split("/")[0].to_i + part.split("/")[1].to_i
	end

	if v > max then
		max = v
	end
end

p max

