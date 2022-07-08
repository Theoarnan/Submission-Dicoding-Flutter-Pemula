import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/res_movie.dart';

class Controller {
  // Function to get data all movie
  static Future<ResMovie> getMovieList() async {
    final String response =
        await rootBundle.loadString('assets/list_movie.json');
    var decodeResponseMovie = json.decode(response);
    ResMovie resMovie = ResMovie.fromJson(decodeResponseMovie);
    return resMovie;
  }

  // Function to get data all category movie
  static Future<List<String>> getAllCategoryList() async {
    ResMovie dataMovie = await getMovieList();
    List<String> dataCategory = [];
    for (var i = 0; i < dataMovie.movies.length; i++) {
      for (var x = 0; x < dataMovie.movies[i].genre!.length; x++) {
        if (!dataCategory.contains(dataMovie.movies[i].genre![x]!.genreName)) {
          dataCategory.add(dataMovie.movies[i].genre![x]!.genreName.toString());
        }
      }
    }
    return dataCategory;
  }

  // Function to get data all movie by type
  // Movie type is NowPlaying or UpComing
  static Future<List<MovieModel>> getMovieUpComingNowPlaying(
      {required bool isUpComing}) async {
    ResMovie dataMovie = await getMovieList();
    List<MovieModel> dataMovies = [];
    String movieType = isUpComing ? "Upcoming" : "NowPlaying";
    for (var i = 0; i < dataMovie.movies.length; i++) {
      if (dataMovie.movies[i].movieType == movieType) {
        dataMovies.add(dataMovie.movies[i]);
      }
    }
    return dataMovies;
  }

  // Function to get data all movie by category
  static Future<List<MovieModel>> getMovieByCategory(
      {required String categoryMovie}) async {
    ResMovie dataMovie = await getMovieList();
    List<MovieModel> dataMovies = [];
    for (var i = 0; i < dataMovie.movies.length; i++) {
      if (dataMovie.movies[i].genre!
          .any((element) => element!.genreName == categoryMovie)) {
        dataMovies.add(dataMovie.movies[i]);
      }
    }
    return dataMovies;
  }
}
