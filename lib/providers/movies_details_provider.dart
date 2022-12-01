import 'package:flutter/foundation.dart';
import 'package:my_movie_app/api/end_points.dart';

import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/movie_cast_and_crew_model.dart';
import 'package:my_movie_app/models/movie_model.dart';

import 'package:my_movie_app/models/movie_videos_model.dart';
import 'package:my_movie_app/models/movies_details_model.dart';

class MoviesDetailsProvider extends ChangeNotifier {
  late MovieDetails movieDetails;
  late MovieVideosList movieVideosList;
  List<MovieVideo> movieVideos = [];

  //List<MoviesPages> moreMoviesPages = [];
  List<Movie> moreMoviesLikeThisMovie = [];

  String get getMovieTrailer {
    String movieTrailer = '';
    movieVideos.forEach((movie) {
      if (movie.type == 'Trailer') {
        movieTrailer = movie.key!;
      }
    });
    return movieTrailer;
  }

  String get getMovieBudget {
    final double newBudget;
    if (movieDetails.budget! >= 1000000) {
       newBudget = movieDetails.budget! / 1000000;
      return '${newBudget.toStringAsFixed(1)}M';
    } else if (movieDetails.budget! >= 1000) {
       newBudget = movieDetails.budget! / 1000;
      return '${newBudget.toStringAsFixed(1)}K';
    } else {
      return '${movieDetails.budget}';
    }
  }

  String get getMovieRevenue {
    final double newRevenue;
    if (movieDetails.revenue! >= 1000000000) {
       newRevenue = movieDetails.revenue! / 1000000000;
      return '${newRevenue.toStringAsFixed(1)}B';
    } else if (movieDetails.revenue! >= 1000000) {
       newRevenue = movieDetails.revenue! / 1000000;
      return '${newRevenue.toStringAsFixed(1)}M';
    } else if (movieDetails.revenue! >= 1000) {
       newRevenue = movieDetails.revenue! / 1000;
      return '${newRevenue.toStringAsFixed(1)}K';
    } else {
      return '${movieDetails.revenue}';
    }
  }

  String get getMovieVoteCount {
    if (movieDetails.voteCount! >= 1000000) {
      final double newCount = movieDetails.voteCount! / 1000000;
      return '${newCount.toStringAsFixed(2)}M';
    } else if (movieDetails.voteCount! >= 1000) {
      final double newCount = movieDetails.voteCount! / 1000;
      return '${newCount.toStringAsFixed(1)}K';
    }
    return '${movieDetails.voteCount!}';
  }

  Future<void> getMovieDetails({required int movieId}) async {
    try {
      final MovieDetails response =
          await MoviesApi.getMovieDetails(movieId: movieId);
      movieDetails = response;
      await getMovieVideos(movieId: movieId);
      await getMoviesMoreLikeThisMovie(movieId: movieId);
      await getMovieCastAndCrew(movieId: movieId);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getMovieVideos({required int movieId}) async {
    try {
      movieVideos = [];
      final MovieVideosList response = await MoviesApi.getMovieExtraData(
          movieId: movieId, endPoint: ApiEndPoints.VIDEOS);
      movieVideosList = response;
      movieVideos = movieVideosList.moviesVideos!;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getMoviesMoreLikeThisMovie({required int movieId}) async {
    try {
      //moreMoviesPages = [];
      moreMoviesLikeThisMovie = [];
      List<Movie> loadedMoreMoviesLikeThisMovie = [];
      final moviesPage =
          await MoviesApi.getMoviesMoreLikeThisMovie(movieId: movieId);
      final extractedMovies = moviesPage.movies as List<Movie>;
      extractedMovies.forEach((movie) {
        //moreMoviesLikeThisMovie.add(movie);
        loadedMoreMoviesLikeThisMovie.add(movie);
      });
      //moreMoviesPages.add(moviesPage);
      moreMoviesLikeThisMovie = loadedMoreMoviesLikeThisMovie;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<Cast> movieCast = [];

  Future<void> getMovieCastAndCrew({required int movieId}) async {
    try {
      List<Cast> loadedMovieCast = [];
      final MovieCastAndCrewModel response =
          await MoviesApi.getMovieCastAndCrew(
              movieId: movieId, endPoint: ApiEndPoints.CREDITS);
      loadedMovieCast = response.cast!;

      movieCast = loadedMovieCast;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
