require_relative './prediction'
def TestResult
	attr_accessor :predictions

	def initialize 
		@predictions = []
	end

	def add_prediction(prediction)
		predictions.push prediction
	end

	def mean
		summation = predictions.inject(0.0) {|sum, pred| sum + pred.error }
		summation / predictions.size	
	end

	def variance
		avg = mean
		summation = predictions.inject(0.0) {|sum, pred| sum  + (pred.error - avg)**2 }
		summation / (predictions.size - 1)
	end

	def rms
		Math.sqrt( predictions.inject(0.0) {|sum, pred| sum + pred.error**2} / predictions.length)
	end

	def stddev
		Math.sqrt(variance)
	end

	def to_a
		arr = []
		predictions.each do |pred|
			arr.push pred.to_a
		end

		arr
	end
end
