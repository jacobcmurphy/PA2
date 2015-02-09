var search_data = {"index":{"searchIndex":["dataloader","movie","moviedata","movietest","object","prediction","user","add_prediction()","error()","mean()","movies()","movies()","new()","new()","new()","new()","new()","new()","predict()","print_results()","rating()","rating()","rms()","run_test()","run_tests()","stats_for_test_set()","stddev()","to_a()","to_a()","viewers()","viewers()","results"],"longSearchIndex":["dataloader","movie","moviedata","movietest","object","prediction","user","movietest#add_prediction()","prediction#error()","movietest#mean()","moviedata#movies()","user#movies()","dataloader::new()","movie::new()","moviedata::new()","movietest::new()","prediction::new()","user::new()","moviedata#predict()","object#print_results()","moviedata#rating()","user#rating()","movietest#rms()","moviedata#run_test()","object#run_tests()","object#stats_for_test_set()","movietest#stddev()","movietest#to_a()","prediction#to_a()","movie#viewers()","moviedata#viewers()",""],"info":[["DataLoader","","DataLoader.html","","<p>Used for loading movie data and user/movie ratings Movie data should be\nstored in a a file called &#39;u.item&#39; …\n"],["Movie","","Movie.html","","<p>Holds data related to a single movie\n"],["MovieData","","MovieData.html","","<p>Performs analysis on loaded data\n"],["MovieTest","","MovieTest.html","","<p>Measures accuracy of movie ratings prediction\n"],["Object","","Object.html","",""],["Prediction","","Prediction.html","","<p>Used for determining the difference between predicted and actual ratings\n"],["User","","User.html","","<p>Stores data about a user\n"],["add_prediction","MovieTest","MovieTest.html#method-i-add_prediction","(prediction)","<p>Add a prediction\n"],["error","Prediction","Prediction.html#method-i-error","()","<p>The difference between real and predicted ratings\n"],["mean","MovieTest","MovieTest.html#method-i-mean","()","<p>Return the average prediction error\n"],["movies","MovieData","MovieData.html#method-i-movies","(user_id)","<p>Returns an array of movie ids seen by the users associated with user_id\n"],["movies","User","User.html#method-i-movies","()","<p>A list of all movie ids that this user has watched.\n"],["new","DataLoader","DataLoader.html#method-c-new","(data_location_hash)","<p>Takes a hash with the keys :path, :training, and :testing Loads all movies\nand user data upon creation …\n"],["new","Movie","Movie.html#method-c-new","(id)","<p>Create a new movie with no ratings or genres\n"],["new","MovieData","MovieData.html#method-c-new","(data_file_path, data_file_name = 'u.data')","<p>Loads data from data_file_path/data_file_name\n"],["new","MovieTest","MovieTest.html#method-c-new","()","<p>Creates a new MovieTest with no predictions\n"],["new","Prediction","Prediction.html#method-c-new","(user_id, movie_id, real_rating, predicted_rating)","<p>Create a new Prediction\n"],["new","User","User.html#method-c-new","(id)","<p>Create a new user with the given id\n"],["predict","MovieData","MovieData.html#method-i-predict","(user_id, movie_id)","<p>Returns an estimated rating between 1 and 5 for how much the user\ndesignated by user_id like the movie …\n"],["print_results","Object","Object.html#method-i-print_results","(test_results)",""],["rating","MovieData","MovieData.html#method-i-rating","(user_id, movie_id)","<p>Returns the rating that the user associated with user_id gave to the movie\nassociated with movie_id\n"],["rating","User","User.html#method-i-rating","(movie_id)","<p>The rating this user gave to the movie with the given id\n"],["rms","MovieTest","MovieTest.html#method-i-rms","()","<p>Returns the root mean square of error for all predictions\n"],["run_test","MovieData","MovieData.html#method-i-run_test","(number_of_records = nil)","<p>Returns a MovieTest object\n<p>Either goes through all records in the test data or number_of_records\nrecords …\n"],["run_tests","Object","Object.html#method-i-run_tests","(movie_data, number_of_test = :all)",""],["stats_for_test_set","Object","Object.html#method-i-stats_for_test_set","(set_name)",""],["stddev","MovieTest","MovieTest.html#method-i-stddev","()","<p>Returns the standard deviation of prediction errors\n"],["to_a","MovieTest","MovieTest.html#method-i-to_a","()","<p>Represent this as an array\n"],["to_a","Prediction","Prediction.html#method-i-to_a","()","<p>Represent this as an array\n"],["viewers","Movie","Movie.html#method-i-viewers","()","<p>A lists of user ids of people that have watched this movie.\n"],["viewers","MovieData","MovieData.html#method-i-viewers","(movie_id)","<p>Returns an array of user ids that have watched the movie associated with\nmovie_id\n"],["results","","results_txt.html","","<p>For set u1\n<p>Testing with all records: mean:    0.849998536151759 rms:    \n1.0762649936536646 stddev:  …\n"]]}}