import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/models/categories_model.dart';
import 'package:my_movie_app/models/http_exception.dart';
import 'package:my_movie_app/models/movie_cast_and_crew_model.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/models/movie_videos_model.dart';
import 'package:my_movie_app/models/movies_details_model.dart';

import '../constants.dart';

class MoviesApi {
  static Future<MoviesPages> getMovies(
      {int page = 1, required String endPoint}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$endPoint?api_key=$api_key&language=en-US&page=$page'));
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Movies.');
    } else {
      return MoviesPages.fromJson(jsonDecode(response.body));
    }
  }

  static Future<MovieDetails> getMovieDetails({required int movieId}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$api_key&language=en-US'));
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Movies.');
    } else {
      return MovieDetails.fromJson(jsonDecode(response.body));
    }
  }

  static Future<MovieVideosList> getMovieExtraData(
      {required int movieId, required String endPoint}) async {
    //https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=de3446f7f8e7be39b914abe7231a3839&language=en-US
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/$endPoint?api_key=$api_key&language=en-US'));
    if (response.statusCode == 200) {
      return MovieVideosList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get popular Movies data');
    }
  }

  static Future<MoviesPages> getMoviesMoreLikeThisMovie(
      {required int movieId}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$api_key&language=en-US&page=1'));
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Movies.');
    } else {
      return MoviesPages.fromJson(jsonDecode(response.body));
    }
  }

  static Future<MovieCastAndCrewModel> getMovieCastAndCrew(
      {required int movieId, required String endPoint}) async {
    //https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=de3446f7f8e7be39b914abe7231a3839&language=en-US
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/$endPoint?api_key=$api_key&language=en-US'));
    if (response.statusCode == 200) {
      return MovieCastAndCrewModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get popular Movies data');
    }
  }

//https://api.themoviedb.org/3/search/movie?api_key=de3446f7f8e7be39b914abe7231a3839&language=en-US&query=f&page=1
  static Future<MoviesPages> searchMovie({required String query}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=$api_key&language=en-US&query=$query'),
    );
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Movies.');
    } else {
      return MoviesPages.fromJson(jsonDecode(response.body));
    }
  }

  static Future<CategoriesListModel> getCategories() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/genre/movie/list?api_key=$api_key&language=en-US'),
    );
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Categories.');
    } else {
      return CategoriesListModel.fromJson(jsonDecode(response.body));
    }
  }

  //https://api.themoviedb.org/3/discover/movie?api_key=de3446f7f8e7be39b914abe7231a3839&language=en-US&sort_by=popularity.desc&with_genres=12

  static Future<MoviesPages> getMoviesByCategoryId(
      {required int categoryId}) async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$api_key&language=en-US&sort_by=popularity.desc&with_genres=$categoryId',
      ),
    );
    if (response.statusCode >= 400) {
      throw HttpException('An Error Occurred While Getting The Movies Categories.');
    } else {
      return MoviesPages.fromJson(jsonDecode(response.body));
    }
  }
}
