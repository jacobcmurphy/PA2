require 'benchmark'
require_relative 'movie_data'
require_relative 'movie_test'

include Benchmark

def stats_for_test_set(set_name)
	movie_data = MovieData.new('ml-100k', set_name)
	puts "For set #{set_name} \n"
	run_tests(movie_data)
	run_tests(movie_data, 100)
	puts "\n*********************************\n"
end

def run_tests(movie_data, number_of_test = :all)
	start_time = Time.now
	if number_of_test == :all
		puts "\nTesting with all records:"
		print_results(movie_data.run_test)
	else
		puts "\nTesting with #{number_of_test} records:"
		print_results(movie_data.run_test number_of_test)
	end
	end_time = Time.now
	number_of_test = 100000 if number_of_test == :all
	puts "Average number of milliseconds per prediction: #{(end_time - start_time)*1000/number_of_test}.\n"

end

def print_results(test_results)
	puts "mean:\t #{test_results.mean}"
	puts "rms:\t #{test_results.rms}"
	puts "stddev:\t #{test_results.stddev}"
	puts "\n"
end

test_sets = [:u1, :u2, :u3, :u4, :u5, :ua, :ub]
test_sets.each{|set| stats_for_test_set(set)}
