import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/movies_collection_widget.dart';
import 'package:my_movie_app/common_widgets/shimmer_list_view.dart';
import 'package:my_movie_app/providers/popular_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: FutureBuilder(
        future:
        Provider.of<PopularMoviesProvider>(context, listen: false)
            .fetchAndSetPopularMovies(),
        builder:
            (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerListView(
              title: 'Popular Movies',
            );
          }
          if (snapshot.hasError == true) {
            return Center(
              child: Column(
                children: [
                  Text('An error occurred!!'),
                  Text('${snapshot.error}'),
                ],
              ),
            );
          }
          return Consumer<PopularMoviesProvider>(
            builder: (context, popularMoviesProvider, child) =>
                MoviesCollectionWidget(
                  title: 'Popular Movies',
                  movies: popularMoviesProvider.popularMovies,
                ),
          );
        },
      ),
    );
  }
}