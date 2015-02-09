##
# Used for determining the difference between predicted and actual ratings
class Prediction
	attr_reader :user_id, :movie_id, :real_rating, :predicted_rating

	##
	# Create a new Prediction
	def initialize(user_id, movie_id, real_rating, predicted_rating)
		@user_id = user_id
		@movie_id = movie_id
		@real_rating = real_rating.to_f
		@predicted_rating = predicted_rating.to_f
	end

	##
	# The difference between real and predicted ratings
	def error
		(real_rating - predicted_rating).abs
	end

	##
	# Represent this as an array
	def to_a
		[user_id, movie_id, real_rating, predicted_rating]
	end
end
