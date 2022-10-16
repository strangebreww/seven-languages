def findLines(pattern)
  File.readlines('day2-file.txt').each_with_index {
    |line, num|
      if (/#{Regexp.quote(pattern)}/ =~ line) != nil
        puts "#{num + 1}: #{line}"
      end
  }
end

puts 'Matches for string1:'
findLines 'string1'
puts

puts 'Matches for fd:'
findLines 'fd'
