class User
	attr_accessor :ratings

	def initialize(id)
		@id = id
		@ratings = Hash.new
	end

	def movies
		@movie_to_rating.keys
	end

	def rating(movie_id)
		@ratings[movie_id]
	end

end
