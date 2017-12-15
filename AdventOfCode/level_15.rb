generator_a = 699
#generator_a = 65
generator_b = 124
#generator_b = 8921

factor_a = 16807
factor_b = 48271

divisor = 2147483647

judge = 0

i = 0
	
while i < 5000000 do
#while i < 40000000 do
	loop do
		generator_a *= factor_a
		times = generator_a / divisor
		generator_a -= times * divisor

		#break
		break if generator_a % 4 == 0
	end

	loop do
		generator_b *= factor_b
		times = generator_b / divisor
		generator_b -= times * divisor

		#break
		break if generator_b % 8 == 0
	end

	bin_a = generator_a.to_s(2)
	bin_b = generator_b.to_s(2)

	bin_a = bin_a[[bin_a.length - 16, 0].max, 16]
	bin_b = bin_b[[bin_b.length - 16, 0].max, 16]

	if bin_a == bin_b then
		judge += 1
	end

	print "."

	i += 1
end

p judge