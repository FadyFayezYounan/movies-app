import 'package:flutter/foundation.dart';
import 'package:my_movie_app/api/end_points.dart';
import 'package:my_movie_app/api/movies_api.dart';
import 'package:my_movie_app/models/categories_model.dart';
import 'package:my_movie_app/models/movie_model.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];

  Future<void> fetchAndSetCategories() async {
    try {
      List<CategoryModel> loadedCategories = [];
      final categoriesResponse = await MoviesApi.getCategories();
      final List<CategoryModel> extractedCategories = categoriesResponse.genres!;
      extractedCategories.forEach((category) {
        loadedCategories.add(category);
      });
      //popularMoviesPages.add(moviesPage);
      categories = loadedCategories;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<Movie> moviesBelongToCategory = [];

  Future<void> getMoviesThatBelongToThisCategory({required int categoryId})async{

    try {
      List<Movie> loadedMovies = [];
      final MoviesPages moviesThatBelongToCategoryResponse = await MoviesApi.getMoviesByCategoryId(categoryId: categoryId);
      final  List<Movie?>? extractedCategories = moviesThatBelongToCategoryResponse.movies;
      extractedCategories!.forEach((movie) {
        loadedMovies.add(movie!);
      });
      moviesBelongToCategory = loadedMovies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }



}
