def calcWeight(list, key)
	list.each do |t|
		if t.split(" ")[0] == key
			ref = t.split("->")[1]

			if ref
				size = t.split(" ")[1]
				size = size[1, size.length - 2].to_i
				refs = ref.strip.split(", ")
				results = refs.map{|r| calcWeight(list, r)}

				if !results.all?{|x| x == results[0]}
					p results
					p "------- Node #{key} unbalanced ----------"
				end

				return results.reduce(:+) + size
			else
				size = t.split(" ")[1]
				size = size[1, size.length - 2]
				
				return size.to_i
			end
		end
	end
end

shoutouts = ARGF.read.strip.split("\n")
keys = shoutouts.map{|so| so.split(" ")[0]}
root = nil
refs = []

shoutouts.each do |so|
	ref = so.split("->")[1]

	if ref
		refs.concat(ref.strip.split(", "))
	end
end

keys.each do |k|
	if !refs.include?(k)
		root = k
		p k
	end
end

calcWeight(shoutouts, root)