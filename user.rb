##
# Stores data about a user 
class User
	attr_accessor :ratings

	##
	# Create a new user with the given id
	def initialize(id)
		@id = id
		@ratings = Hash.new
	end

	##
	# A list of all movie ids that this user has watched.
	def movies
		@movie_to_rating.keys
	end

	##
	# The rating this user gave to the movie with the given id
	def rating(movie_id)
		@ratings[movie_id]
	end

end
