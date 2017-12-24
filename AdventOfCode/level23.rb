def calcPrimeNumbers(min, max, step)
	count = 0

	while min <= max 
		if min % 2 == 0 then
			count += 1

			p "#{min} is !prime"
		else
			i = 3

			while i < min / 2
				if min % i == 0 then
					count += 1
					p "#{min} is !prime"
					break
				end

				i += 2
			end
		end

		min += step
	end

	p count
end

def run(lines)
	regs = Hash.new

	mult = 0
	i = 0

	while i < lines.length do
		split = lines[i].split(" ")
		cmd = split[0]
		reg = Integer(split[1]) rescue split[1]
		val = Integer(split[2]) rescue regs.fetch(split[2], 0)
		inc = 1

		#p "#{cmd} #{reg} #{val}"

		if cmd == "set" then
			regs.store(reg, val)
		elsif cmd == "sub" then
			regs.store(reg, regs.fetch(reg, 0) - val)
		elsif cmd == "mul" then
			mult += 1
			regs.store(reg, regs.fetch(reg, 0) * val)
		elsif cmd == "jnz" then
			reg = Integer(reg) rescue regs.fetch(reg, 0)

			if reg != 0 then
				inc = val
			end
		end

		i += inc

		print "."
	end

	p "#{mult}"
end

lines = ARGF.read.strip.split("\n")
regs = Hash.new()

mulinstructions = 0
i = 0

# Part 1
#run(lines)

# Part 2
calcPrimeNumbers(106700, 123700, 17)