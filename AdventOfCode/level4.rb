passphrases = ARGF.read.strip.split("\n")
counter = 0

passphrases.each do |phrase|
	words = phrase.split(" ")
	valid = true

	words.each_index do |i|
		words.each_index do|j|

			# part1
#			if i != j && words[i] == words[j]
#				valid = false
#			end

			# part2
			if i != j && words[i].length == words[j].length

			end
		end
	end

	if valid
		counter += 1
	end
end

p counter