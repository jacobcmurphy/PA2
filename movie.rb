require 'set'

##
# Holds data related to a single movie
class Movie
	attr_accessor :genres, :ratings

	##
	# Create a new movie with no ratings or genres
	def initialize(id)
		@id = id
		@ratings = Hash.new
		@genres = Set.new
	end

	##
	# A lists of user ids of people that have watched this movie.
	def viewers
		@ratings.keys
	end


end
