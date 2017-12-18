def run(id, lines)
	regs = {"p" => id}
	i = 0
	st = 0

	#while i < 8 do
	while i < lines.length do
		split = lines[i].split(" ")
		cmd = split[0]
		reg = Integer(split[1]) rescue split[1]
		val = Integer(split[2]) rescue regs.fetch(split[2], 0)
		inc = 1

		#p "#{cmd} #{reg} #{val}"

		if cmd == "snd" then
			#val = Integer(reg) rescue regs.fetch(reg, 0)
			$fifos[1 - id].push(regs.fetch(reg, 0))
			st += 1
		elsif cmd == "set" then
			regs.store(reg, val)
		elsif cmd == "add" then
			regs.store(reg, regs.fetch(reg, 0) + val)
		elsif cmd == "mul" then
			regs.store(reg, regs.fetch(reg, 0) * val)
		elsif cmd == "mod" then
			regs.store(reg, regs.fetch(reg, 0) % val)
		elsif cmd == "rcv" then
			while $fifos[id].length == 0
				#sleep(1)
				$waiting[id] = true

				if $waiting[id] && $waiting[1 - id] then
					p "both waiting"
					p "p#{id} sent #{st} times"
					return
				end
			end

			$waiting[id] = false
			regs.store(reg, $fifos[id].shift)
		elsif cmd == "jgz" then
			reg = Integer(reg) rescue regs.fetch(reg, 0)

			if reg > 0 then
				inc = val
			end
		end

		i += inc

		#p "#{id}: #{regs}"
		#p $fifos

		print "."
	end

	p "p#{id} sent #{st} times"
end

lines = ARGF.read.strip.split("\n")
regs = Hash.new()
sound = -1

i = 0

#while i < lines.length do
#	split = lines[i].split(" ")
#	cmd = split[0]
#	reg = split[1]
#	val = Integer(split[2]) rescue regs.fetch(split[2], 0)
#	inc = 1
#
#	if cmd == "snd" then
#		sound = regs.fetch(reg)
#	elsif cmd == "set" then
#		regs.store(reg, val)
#	elsif cmd == "add" then
#		regs.store(reg, regs.fetch(reg, 0) + val)
#	elsif cmd == "mul" then
#		regs.store(reg, regs.fetch(reg, 0) * val)
#	elsif cmd == "mod" then
#		regs.store(reg, regs.fetch(reg, 0) % val)
#	elsif cmd == "rcv" then
#		if regs.fetch(reg, 0) != 0 then
#			p sound
#			break
#		end
#	elsif cmd == "jgz" then
#		if regs.fetch(reg, 0) != 0 then
#			inc = val
#		end
#	end
#
#	#p regs
#
#	i += inc
#end

#p regs

# Part 2

$waiting = [false, false]
$fifos = []
$fifos << Array.new
$fifos << Array.new

threads = []
threads << Thread.new { run(0, lines) }
threads << Thread.new { run(1, lines) }

threads.each { |t| t.join }