import 'package:submission_bmafup_movie_dicoding_app/model/cast_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/genre_model.dart';

// class MovieModel
// class to handle data from json and mapping data movie
class MovieModel {
  String? id;
  String? originalTitle;
  String? title;
  String? overview;
  String? popularity;
  String? releaseDate;
  String? voteAverage;
  String? voteCount;
  String? posterPath;
  String? backdropPath;
  List<GenreModel?>? genre;
  List<CastModel?>? cast;
  String? movieType;

  MovieModel({
    this.id,
    this.originalTitle,
    this.title,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.posterPath,
    this.backdropPath,
    this.genre,
    this.cast,
    this.movieType,
  });

  // To mapping data from json
  MovieModel.fromMap(Map<String, dynamic> data) {
    id = data['id'].toString();
    originalTitle = data['original_title'];
    title = data['title'];
    overview = data['overview'];
    popularity = data['popularity'].toString();
    releaseDate = data['release_date'];
    voteAverage = data['vote_average'].toString();
    voteCount = data['vote_count'].toString();
    posterPath = data['poster_path'];
    backdropPath = data['backdrop_path'];
    genre = (data["genre"] as List).map((i) => GenreModel.fromJson(i)).toList();
    cast = (data["cast"] as List).map((i) => CastModel.fromJson(i)).toList();
    movieType = data['movie_type'];
  }
}
