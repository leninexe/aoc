# 0 to 8

a = 1
b = 67
c = 67
b *= 100
b += 100000
c = b
c += 17000
h = 0
g = 1

p "a = #{a}, b = #{b}, c = #{c}"

# 9 to 20
while g != 0
	f = 1
	d = 2

	while g != 0
		e = 2

		if b % d == 0 then
#		while g != 0
#			g = d * e - b
#
#			if g == 0 then
				f = 0
#			end
#
#			e += 1
#			g = e - b
#
#			p "inner: #{g}"
		end

		# 21 to ... 24
		d += 1
		g = d - b

		#p "outer: #{g}"
	end

	if f == 0 then
		h += 1
	end

	g = b - c
	b += 17

	p "outest: #{g}"
end

p h