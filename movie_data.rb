require './DataStore'
class MovieData
	def initialize(file_path, data_file=nil)
		@file_path = file_path
		@data_file = (data_file) ? data_file.to_s : 'u.data'

		DS = DataStore.new
		@users = DS.users
		@movies = DS.movies
		@ratings = DS.ratings
		
		load_data
	end

	def load_data

	end

	private
	def add_user(params)
		@users.insert(id: params[:id], age: params[:age], occupation: params[:occupation])
	end

	def add_movie(params)
		@movies.insert(id: params[id],
					  title: params[:title],
					  unknown: params[:unknown],
					  action: params[:action], adventure: params[:adventure],
					  childrens: params[:childrens], comedy: params[:comedy],
					  )
	end

	def add_rating(user_id, mov_id, rating)
		@rating.insert(user_id: user_id, movie_id: mov_id, rating: rating.to_f)
	end
end
