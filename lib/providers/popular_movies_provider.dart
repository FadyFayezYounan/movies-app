import 'package:flutter/material.dart';
import 'package:my_movie_app/api/end_points.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_model.dart';

class PopularMoviesProvider extends ChangeNotifier {

  //List<MoviesPages> popularMoviesPages = [];
  List<Movie> popularMovies = [];

  Future<void> fetchAndSetPopularMovies() async {
    try {
      //popularMoviesPages = [];
      popularMovies =[];
      List<Movie> loadedPopularMovies = [];
      final moviesPage = await MoviesApi.getMovies(endPoint: ApiEndPoints.POPULAR);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //popularMovies.add(movie);
        loadedPopularMovies.add(movie);
      });
      //popularMoviesPages.add(moviesPage);
      popularMovies = loadedPopularMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

}
