import 'package:flutter/material.dart';
import 'package:my_movie_app/pages/home/movie_widget.dart';
import 'package:my_movie_app/providers/movies_search_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'app_icon.dart';

class MoviesSearch extends SearchDelegate {
  final Color? appBarColor;
  final Color? scaffoldBackgroundColor;

  MoviesSearch({
    this.appBarColor,
    this.scaffoldBackgroundColor,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: IconButton(
          onPressed: () {
            if (query.trim().isEmpty == true) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(
            Icons.clear_rounded,
            color: Colors.grey,
          ),
          splashRadius: 20.0,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        color: Colors.grey,
      ),
      splashRadius: 20.0,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<MoviesSearchProvider>(
      child: buildEmptySearchWidget(),
      builder: (context, moviesSearchProvider, child) {
        if (moviesSearchProvider.searchMovies.length == 0) {
          return child!;
        }
        return GridView.builder(
          padding:
          const EdgeInsets.symmetric(horizontal: KAppPadding),
          itemCount: moviesSearchProvider.searchMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: KAppPadding,
            mainAxisSpacing: KAppPadding,
            childAspectRatio: 0.74,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              query =
                  moviesSearchProvider.searchMovies[index].title ??
                      query;
            },
            child: MovieWidget(
              movie: moviesSearchProvider.searchMovies[index],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResultsAndSuggestions(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: appBarColor ?? Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
      appBarTheme: AppBarTheme(
        color: appBarColor ?? Colors.white,
      ),
    );
  }

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search...';

  Widget buildSearchResultsAndSuggestions(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MoviesSearchProvider>(context, listen: false)
          .searchMoviesResult(query: query),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if(query.trim().isEmpty == true){
          return buildEmptySearchWidget();
        }
        if(snapshot.hasError == true){
          return buildEmptySearchWidget();
        }
        return Consumer<MoviesSearchProvider>(
          child: buildEmptySearchWidget(),
          builder: (context, moviesSearchProvider, child) {
            if (moviesSearchProvider.searchMovies.length == 0) {
              return child!;
            }
            return GridView.builder(
              padding:
              const EdgeInsets.symmetric(horizontal: KAppPadding),
              itemCount: moviesSearchProvider.searchMovies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: KAppPadding,
                mainAxisSpacing: KAppPadding,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  query =
                      moviesSearchProvider.searchMovies[index].title ??
                          query;
                },
                child: MovieWidget(
                  movie: moviesSearchProvider.searchMovies[index],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildEmptySearchWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: AppIcon(
            iconName: IconName.search,
            iconColor: Colors.grey,
            size: 64,
          ),
        ),
        Center(child: Text('No movies founded')),
      ],
    );
  }

  @override
  // TODO: implement transitionAnimation
  Animation<double> get transitionAnimation => super.transitionAnimation;
}