import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/movies_collection_widget.dart';
import 'package:my_movie_app/common_widgets/shimmer_list_view.dart';
import 'package:my_movie_app/providers/upcoming_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: FutureBuilder(
        future:
        Provider.of<UpcomingMoviesProvider>(context, listen: false).fetchAndSetUpcomingMovies(),
        builder:
            (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerListView(
              title: 'Upcoming Movies',
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
          return Consumer<UpcomingMoviesProvider>(
            builder: (context, upcomingMoviesProvider, child) =>
                MoviesCollectionWidget(
                  title: 'Upcoming Movies',
                  movies: upcomingMoviesProvider.upcomingMovies,
                ),
          );
        },
      ),
    );
  }
}