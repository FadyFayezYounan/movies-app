



import 'package:flutter/material.dart';
import 'package:my_movie_app/api/end_points.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_model.dart';

class UpcomingMoviesProvider extends ChangeNotifier{


  //List<MoviesPages> popularMoviesPages = [];
  List<Movie> upcomingMovies = [];

  Future<void> fetchAndSetUpcomingMovies() async {
    try {
      //popularMoviesPages = [];
      upcomingMovies =[];
      List<Movie> loadedUpcomingMovies = [];
      final moviesPage = await MoviesApi.getMovies(endPoint: ApiEndPoints.UPCOMING);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //popularMovies.add(movie);
        loadedUpcomingMovies.add(movie);
      });
      //popularMoviesPages.add(moviesPage);
      upcomingMovies = loadedUpcomingMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

}