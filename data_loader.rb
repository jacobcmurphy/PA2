require_relative 'user'
require_relative 'movie'
require 'csv'

class DataLoader
	MOVIE_DATA_FILE = 'u.item'
	GENRE_LIST = ['unknown', 'action', 'adventure', 
			   'animation', 'childrens', 'comedy', 'crime',
			   'documentary', 'drama', 'fantasy', 'noir', 
			   'horror', 'musical', 'mystery', 'romance', 
			   'sci_fi', 'thriller', 'war', 'western']



	attr_reader :all_users, :all_movies

	def initialize(data_location_hash)
		@data_file_path = data_location_hash[:path]
		@training_file_name = data_location_hash[:training]
		@testing_file_name = data_location_hash[:testing]

		@all_movies = Hash.new
		@all_users = Hash.new

		load_movie_data
		load_training_data
	end

	private

	def load_training_data
		CSV.foreach(@data_file_path+'/'+@training_file_name, {col_sep: "\t", encoding: 'windows-1251:utf-8'}) do |row|
			user_id, movie_id, rating, timestamp = row
			rating = rating.to_f
			user = get_obj(User, @all_users, user_id)
			user.ratings[movie_id] = rating

			movie = get_obj(Movie, @all_movies, movie_id)
			movie.ratings[user_id] = rating
		end
	end

	def load_movie_data
		full_file_path = @data_file_path + '/' + MOVIE_DATA_FILE
		CSV.foreach(full_file_path, {col_sep: "|", encoding: 'windows-1251:utf-8'}) do |row|
			id, title, date, released, url, *genre_bools = row	
			has_genres = GENRE_LIST.zip(genre_bools).select{ |genre, bool| bool == '1'}.map{ |genre, bool| genre}
			movie = get_obj(Movie, @all_movies, id)
			movie.genres.merge has_genres
		end
	end


	# obj_type should only be User or Movie
	def get_obj (class_type, obj_hash, obj_id)
		obj_hash[obj_id] ||= class_type.new(obj_id)
		obj_hash[obj_id]
	end


end
