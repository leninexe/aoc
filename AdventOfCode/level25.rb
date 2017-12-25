state = "A"
tape = [0]
cursor = 0
diagnostic = 12667664

i = 0

while i < diagnostic
	#p tape

	if state == "A" then
		if tape[cursor] == 0 then
			tape[cursor] = 1
			cursor += 1
			state = "B"
		elsif tape[cursor] == 1 then
			tape[cursor] = 0
			cursor -= 1
			state = "C"
		end
	elsif state == "B" then
		if tape[cursor] == 0 then
			tape[cursor] = 1
			cursor -= 1
			state = "A"
		elsif tape[cursor] == 1 then
			cursor += 1
			state = "D"
		end
	elsif state == "C" then
		if tape[cursor] == 0 then
			cursor -= 1
			state = "B"
		elsif tape[cursor] == 1 then
			tape[cursor] = 0
			cursor -= 1
			state = "E"
		end
	elsif state == "D" then
		if tape[cursor] == 0 then
			tape[cursor] = 1
			cursor += 1
			state = "A"
		elsif tape[cursor] == 1 then
			tape[cursor] = 0
			cursor += 1
			state = "B"
		end
	elsif state == "E" then
		if tape[cursor] == 0 then
			tape[cursor] = 1
			cursor -= 1
			state = "F"
		elsif tape[cursor] == 1 then
			cursor -= 1
			state = "C"
		end
	elsif state == "F" then
		if tape[cursor] == 0 then
			tape[cursor] = 1
			cursor += 1
			state = "D"
		elsif tape[cursor] == 1 then
			cursor += 1
			state = "A"
		end
	end

	if cursor >= tape.length then
		tape << 0
	elsif cursor < 0 then
		tape = [0] + tape
		cursor = 0
	end

	i += 1
end

p tape.select{|v| v == 1}.length