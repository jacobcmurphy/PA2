require 'csv'

class DataLoader
	# a block is expected to handle each row once parsed
	def self.each(file_path, delimiter = "\t")
		CSV.foreach(file_path, {col_sep: delimiter}) do |row|
			yield(row) if block_given?	
		end
	end

end
