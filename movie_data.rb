require 'csv'
require_relative 'data_loader' 
require_relative 'movie_test'
require_relative 'prediction'

##
# Performs analysis on loaded data
class MovieData

	##
	# Loads data from data_file_path/data_file_name
	def initialize(data_file_path, data_file_name = 'u.data')
		@data_file_path = data_file_path
		@training_file_name, @test_file_name = training_and_test_file_names(data_file_name)

		data = get_data

		@all_movies = data.all_movies
		@all_users = data.all_users
	end

	##
	# Returns the rating that the user associated with user_id
	# gave to the movie associated with movie_id
	def rating(user_id, movie_id)
		@all_users[user_id].rating movie_id
	end

	## 
	# Returns an array of movie ids seen by the users associated with user_id
	def movies(user_id)
		@all_users[user_id].movies
	end

	##
	# Returns an array of user ids that have watched the movie associated with movie_id
	def viewers(movie_id)
		@all_movies[movie_id].viewers
	end

	##
	# Returns an estimated rating between 1 and 5 for how
	# much the user designated by user_id like the movie
	# designated by movie_id
	def predict(user_id, movie_id)
		user_genre_ratings = genre_ratings(@all_users[user_id].ratings)
		movie_genres = @all_movies[movie_id].genres
		rating, matched_genre_count = 0, 0
		movie_genres.each do |genre|
			if user_genre_ratings.has_key? genre
				rating += user_genre_ratings[genre]
				matched_genre_count += 1
			end
		end
		return (matched_genre_count == 0) ? 1 : (rating.to_f / matched_genre_count)
	end

	##
	# Returns a MovieTest object
	#
	# Either goes through all records in the test data or number_of_records records
	def run_test(number_of_records = nil)
		test_file_exists?
		movie_test = MovieTest.new
		count = 1
		CSV.foreach(@data_file_path+'/'+@test_file_name, {col_sep: "\t"}) do |row|
			user_id, movie_id, rating, timestamp = row
			rating = rating.to_f
			predicted_rating = predict(user_id, movie_id)
			movie_test.add_prediction Prediction.new(user_id, movie_id, rating, predicted_rating)
			count += 1
			break if count == number_of_records
		end
		movie_test
	end

	private
	##
	# Returns array of names for training file and test file
	def training_and_test_file_names(data_file_name)
		if data_file_name == 'u.data'
			['u.data', nil]
		else
			[data_file_name.to_s + '.base', data_file_name.to_s + '.test']
		end
	end
	
	##
	# Load data to analyze from the source files
	def get_data
		data_hash = {path: @data_file_path, training: @training_file_name, testing: @testing_file_name}
		DataLoader.new(data_hash)
	end

	##
	# Determine if the test file exists.
	# If not, terminate the program.
	def test_file_exists?
		if @test_file_name.nil?
			puts "No test data given to run. Exiting."
			exit(0)
		end
	end

	##
	# Returns a hash of genres to the average rating for the genre.
	#
	# movies_to_rating should be a hash of movie ids to ratings
	def genre_ratings(movies_to_rating)
		genre_rating_hash = Hash.new {|hash, key| hash[key] = []} 

		movies_to_rating.each do |movie_id, rating|
			@all_movies[movie_id].genres.each do |genre|
				genre_rating_hash[genre].push rating
			end
		end
		ratings_hash = Hash.new
		genre_rating_hash.map{|genre, ratings| ratings_hash[genre] = ratings.inject(&:+).to_f / ratings.count}
		ratings_hash
	end
end
