module ActsAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def initialize
			read
		end

		def read
			@csv_contents = []
			file = File.new(self.class.to_s.downcase + '.txt')
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		def each(&block)
			csv_contents.each {|row| block.call CsvRow.new(headers, row)}
		end

		class CsvRow
			def initialize(headers, row)
				@headers = headers
				@row = row
			end

			def headers
				@headers
			end

			def row
				@row
			end

			def method_missing(name, *args)
				row_index = headers.index(name.to_s)
				row[row_index] 
			end
		end

		attr_accessor :headers, :csv_contents

	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each {|row| puts row.one} 
