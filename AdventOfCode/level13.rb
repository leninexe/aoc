class Layer
	def initialize(depth, range) 
		@depth = depth
		@range = range
		@scanner = 0
		@dir = 1
	end

	def moveOn()
		@scanner += @dir

		if @scanner == @range - 1 then
			@dir = @dir * -1
		elsif @scanner == 0 then
			@dir = @dir * -1
		end
	end
end

lines = ARGF.read.strip.split("\n")
layers = Array.new()
max = 0

lines.each do |l|
	spl = l.split(":").map(&:to_i)
	layers.push(Layer.new(spl[0], spl[1]))

	if spl[0] > max then
		max = spl[0]
	end
end

startlayers = layers.map{|e|e.dup}
pos = 0
severity = 0

while pos <= max do
	current = layers.select{|l|l.instance_variable_get(:@depth) == pos}
	
	if current[0] != nil then
		if current[0].instance_variable_get(:@scanner) == 0 then
			severity += pos * current[0].instance_variable_get(:@range)
		end
	end

	layers.each{|l|l.moveOn()}
	pos += 1
end

p "Severity = #{severity}"

# Part 2
delay = 0

while true do
	p "Testing #{delay}"

	layers = startlayers.map{|e|e.dup}
	layers.map{|l|l.moveOn()}
	startlayers = layers.map{|e|e.dup}
	pos = 0
	severity = 0

	while pos <= max do
		current = layers.select{|l|l.instance_variable_get(:@depth) == pos}
		
		if current[0] != nil then
			if current[0].instance_variable_get(:@scanner) == 0 then
				severity = 1
				break
			end
		end

		layers.each{|l|l.moveOn()}
		pos += 1
	end

	if severity == 0 then
		break
	end

	delay += 1
end

delay += 1
p delay