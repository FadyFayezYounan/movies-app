import 'package:flutter/foundation.dart';
import 'package:my_movie_app/api/end_points.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_model.dart';

class NowPlayingMoviesProvider extends ChangeNotifier {
  //List<MoviesPages> nowPlayingMoviesPages = [];
  List<Movie> nowPlayingMovies = [];

  Future<void> fetchAndSetNowPlayingMovies() async {
    try {
      //nowPlayingMoviesPages = [];
      nowPlayingMovies = [];
      List<Movie> loadedNowPlayingMovies = [];
      final moviesPage =
          await MoviesApi.getMovies(endPoint: ApiEndPoints.NOW_PLAYING);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //nowPlayingMovies.add(movie);
        loadedNowPlayingMovies.add(movie);
      });
      //nowPlayingMoviesPages.add(moviesPage);
      nowPlayingMovies = loadedNowPlayingMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  int get nowPlayingMoviesLength => nowPlayingMovies.length <= 30 ? 5 : 10;

  int currentIndex = 0;

  void changeCurrentIndex(int newValue) {
    currentIndex = newValue;
    notifyListeners();
  }
}
