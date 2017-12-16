#dancemoves = ["s1","x3/4","pe/b"]
#programs = ["a","b","c","d","e"]
#hprograms = {"a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4}

dancemoves = ARGF.read.strip.split(",")
programs = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
init = programs.map{|x| x.dup}

p programs
p init

p programs == init

i = 0

while i < 1000 do
	dancemoves.each do |dm|
		if dm[0] == "s" then
			size = dm[1,dm.length - 1].to_i
			programs = programs[programs.length - size, size] + programs[0, programs.length - size]
		elsif dm[0] == "x" then
			pos = dm[1, dm.length - 1].split("/").map(&:to_i)
			btw = programs[pos[0]]
			programs[pos[0]] = programs[pos[1]]
			programs[pos[1]] = btw
		elsif dm[0] == "p" then
			vals = dm[1, dm.length - 1].split("/")
			programs.map!{|x| x == vals[0] ? vals[1] : x == vals[1] ? vals[0] : x }
		end
	end

	print "."

	i += 1

	if programs == init then
		p "same after #{i} moves"
		p programs
	end
end

result = ""
programs.each{|p| result += p}

p result

programs = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
i = 0

while i < 10 do
	dancemoves.each do |dm|
		if dm[0] == "s" then
			size = dm[1,dm.length - 1].to_i
			programs = programs[programs.length - size, size] + programs[0, programs.length - size]
		elsif dm[0] == "x" then
			pos = dm[1, dm.length - 1].split("/").map(&:to_i)
			btw = programs[pos[0]]
			programs[pos[0]] = programs[pos[1]]
			programs[pos[1]] = btw
		elsif dm[0] == "p" then
			vals = dm[1, dm.length - 1].split("/")
			programs.map!{|x| x == vals[0] ? vals[1] : x == vals[1] ? vals[0] : x }
		end
	end

	print "."

	if programs == init then
		p "same after #{i} moves"
	end

	i += 1
end

result = ""
programs.each{|p| result += p}

p result

