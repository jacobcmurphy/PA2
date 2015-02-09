require 'set'

class Movie
	attr_accessor :genres, :ratings

	def initialize(id)
		@id = id
		@ratings = Hash.new
		@genres = Set.new
	end

	def viewers
		@ratings.keys
	end


end
