require_relative './prediction'

##
# Measures accuracy of movie ratings prediction
class MovieTest
	attr_accessor :predictions

	##
	# Creates a new MovieTest with no predictions
	def initialize 
		@predictions = []
	end

	##
	# Add a prediction
	def add_prediction(prediction)
		predictions.push prediction
	end

	##
	# Return the average prediction error 
	def mean
		summation = predictions.inject(0.0) {|sum, pred| sum + pred.error }
		summation / predictions.size	
	end

	##
	# Returns the root mean square of error for all predictions
	def rms
		Math.sqrt( predictions.inject(0.0) {|sum, pred| sum + pred.error**2} / predictions.length)
	end

	##
	# Returns the standard deviation of prediction errors
	def stddev
		Math.sqrt(variance)
	end

	##
	# Represent this as an array
	def to_a
		arr = []
		predictions.each do |pred|
			arr.push pred.to_a
		end

		arr
	end

	private

	##
	# Variance of all predictions, used for calculating standard deviation
	def variance
		avg = mean
		summation = predictions.inject(0.0) {|sum, pred| sum  + (pred.error - avg)**2 }
		summation / (predictions.size - 1)
	end

end
