import 'package:flutter/foundation.dart';

import 'package:my_movie_app/api/end_points.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_model.dart';


class TopRatedMoviesProvider extends ChangeNotifier {
  //List<MoviesPages> topRatedMoviesPages = [];
  List<Movie> topRatedMovies = [];

  Future fetchAndSetTopRatedMovies() async {
    try {
      //topRatedMoviesPages = [];
      topRatedMovies = [];
      List<Movie> loadedToRatedMovies = [];
      final moviesPage = await MoviesApi.getMovies(endPoint: ApiEndPoints.TOP_RATED);
      //topRatedMoviesPages.add(moviesPage);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //topRatedMovies.add(movie);
        loadedToRatedMovies.add(movie);
      });
      topRatedMovies = loadedToRatedMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
