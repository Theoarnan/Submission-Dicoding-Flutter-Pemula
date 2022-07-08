import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';

// class ResMovie
// class to handle data from json and mapping data
class ResMovie {
  final List<MovieModel> movies;
  final String error;

  ResMovie(this.movies, this.error);

  ResMovie.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => MovieModel.fromMap(i))
            .toList(),
        error = "";

  ResMovie.withError(String errorValue)
      : movies = <MovieModel>[],
        error = errorValue;
}
