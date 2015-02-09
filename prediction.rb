class Prediction
	attr_reader :user_id, :movie_id, :real_rating, :predicted_rating

	def initialize(user_id, movie_id, real_rating, predicted_rating)
		@user_id = user_id
		@movie_id = movie_id
		@real_rating = real_rating.to_f
		@predicted_rating = predicted_rating.to_f
	end

	def error
		(real_rating - predicted_rating).abs
	end

	def to_a
		[user_id, movie_id, real_rating, predicted_rating]
	end
end
