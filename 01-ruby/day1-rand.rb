answer = rand(10)

puts 'Try to guess a number between 0 and 9'
guess = gets.to_i

while guess != answer
	if guess > answer
		puts 'Your guess is greater than answer'
	else
		puts 'Your guess is lower than answer'
	end
	guess = gets.to_i
end

puts "Your guess is right: #{guess}"
