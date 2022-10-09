def printFourEach(data)
	start = 0
	finish = data.length - 1
	step = 4

	while start < finish
		puts "----"
		(start..start + step - 1).each do |i|
		   puts data[i]
		end
		start = start + step
	end
end

def printFourEachSlice(data)
	data.each_slice(4) {|a, b, c, d| puts puts "#{a}, #{b}, #{c}, #{d}"}
end

arr = Array.new(16) {|i| i+1}

puts "Print four elements of an array with each"
printFourEach(arr)

puts "Print four elements of an array with each_slice"
printFourEachSlice(arr)
