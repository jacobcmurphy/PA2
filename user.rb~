class User
	attr_reader :id

	GenreData = Struct.new(:total_views, :ratings_sum)

	def initialize(id)
		@id = id
		@mov_obj_to_rating = {}
		@genre_to_data = nil
	end

	def add_rating(mov, rating)
		@mov_obj_to_rating[mov] = rating
	end

	def rating(mov)
		@mov_obj_to_rating[mov]
	end
	
	#check that movie isn't already rated
	#generate a "score" for each genre based on movies watched
	#go through each of mov_obj's genres to and average over the "scores" from before"
	def predict(mov)
		if @mov_obj_to_rating.has_key? mov
			@mov_obj_to_rating[mov] 
		else
			mov.genres.inject(0.0){|sum, genre| sum + average_genre_rating(genre)} / mov.genre.count
		end
	end

	def movies
		@mov_obj_to_rating.keys.map(|mov| mov.id)
	end

	private

	def genre_ratings
		if @genre_to_data.nil?
			@genre_to_data = Hash.new
			movies.each do |mov|
				mov.genres.each do |genre|
					@genre_to_data[genre] ||= GenreData.new(0,0)
					@genre_to_data[genre].total_views += 1
					@genre_to_data[genre].ratings_sum += @mov_obj_to_rating[mov]
				end
			end
		end
		@genre_to_data
	end

	def average_genre_rating(genre)
		return 0 if genre_ratings[genre].nil?

		genre_data = genre_ratings[genre]
		genre_data.ratings_sum.to_f / genre_data.total_views
	end
end
