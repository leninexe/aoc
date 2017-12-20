class Particle
	def initialize(id, pos, vel, acc)
		@id = id
		@pos = pos
		@velocity = vel
		@acceleration = acc
	end

	def move
		@velocity.each_index{ |i| @velocity[i] += @acceleration[i] }
		@pos.each_index{ |i| @pos[i] += @velocity[i] }
	end

	def distance()
		@pos[0].abs + @pos[1].abs + @pos[2].abs
	end

	def acceleration
		@acceleration[0].abs + @acceleration[1].abs + @acceleration[2].abs
	end

	def position
		@pos
	end

	def colliding(posx)
		return @pos[0] == posx[0] && @pos[1] == posx[1] && @pos[2] == posx[2]
	end
end

lines = ARGF.read.strip.split("\n")
particles = Array.new
c = 0

while c < lines.length
	l = lines[c]
	i = l.index("<")
	pos = l[i + 1, l.index(">") - (i + 1)].split(",").map(&:to_i)

	i = l.index("<", i + 1)
	vel = l[i + 1, l.index(">", i + 1) - (i + 1)].split(",").map(&:to_i)

	i = l.index("<", i + 1)
	acc = l[i + 1, l.index(">", i + 1) - (i + 1)].split(",").map(&:to_i)

	particles << Particle.new(c, pos, vel, acc)

	c += 1
end

# Part 1
minAcceleration = nil
result = nil

particles.each do |p|
	if minAcceleration == nil || p.acceleration < minAcceleration then
		minAcceleration = p.acceleration
		result = p
	end
end

p result

# Part 2 -> Really dirty approach just testing 10000 iterations and checking if it's correct
i = 0

while i < 10000 do
	particles.each{ |p| p.move }

	particles.each do |p|
		colliding = particles.select{ |px| px.colliding(p.position)}

		if colliding.length > 1 then
			particles.select!{ |px| !px.colliding(p.position)}
		end
	end

	if i % 1000 == 0 then
		print "M"
	elsif i % 500 == 0 then
		print "C"
	elsif i % 100 == 0 then
		print "H"
	else
		print "."
	end

	i += 1
end

p particles.length