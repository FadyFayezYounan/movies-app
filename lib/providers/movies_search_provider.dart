


import 'package:flutter/foundation.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_model.dart';

class MoviesSearchProvider extends ChangeNotifier{

  List<Movie> searchMovies = [];

  bool loadingMovies = false;

  void changeLoadingMoviesValue(bool newValue){
    loadingMovies = newValue;
    notifyListeners();
  }
  Future<void> searchMoviesResult({required String query}) async {
    //changeLoadingMoviesValue(true);
    try {
      //popularMoviesPages = [];
      searchMovies =[];
      List<Movie> loadedSearchMovies = [];
      final moviesPage = await MoviesApi.searchMovie(query: query);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //popularMovies.add(movie);
        loadedSearchMovies.add(movie);
      });
      //popularMoviesPages.add(moviesPage);
      searchMovies = loadedSearchMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
    //changeLoadingMoviesValue(false);
  }
}