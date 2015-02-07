require 'sequel'

class DataStore
	def initialize
		@DB = Sequel.sqlite # memory database
		create_tables
	end

	def movies
		@DB[:movies]
	end

	def users
		@DB[:users]
	end

	def ratings
		@DB[:ratings]
	end
	
	private

	def create_tables
		make_users_table
		make_movies_table
		make_ratings_table
	end

	def make_users_table
		@DB.create_table :users do
			primary_key :id
			Integer :age
			String :gender
			String :occupation
		end

	end

	def make_movies_table
		@DB.create_table :movies do
			primary_key :id
			String :title
			Boolean :unknown
			Boolean :action
			Boolean :adventure
			Boolean :animation
			Boolean :childrens
			Boolean :comedy
			Boolean :crime
			Boolean :documentary
			Boolean :drama
			Boolean :fantasy
			Boolean :noir
			Boolean :horror
			Boolean :musical
			Boolean :mystery
			Boolean :romance
			Boolean :sci_fi
			Boolean :thriller
			Boolean :war
			Boolean :western
		end
	end

	def make_ratings_table
		@DB.create_table :ratings do
			Integer :user_id
			Integer :movie_id
			Float :rating
		end
	end
end
