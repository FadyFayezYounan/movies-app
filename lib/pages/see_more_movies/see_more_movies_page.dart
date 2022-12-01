import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/shimmer_movie_widget.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/pages/home/movie_widget.dart';

class SeeMoreMoviesPage extends StatelessWidget {
  final List<Movie> movies;

  const SeeMoreMoviesPage({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See More'),
      ),
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: KAppPadding),
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: KAppPadding,
            mainAxisSpacing: KAppPadding,
            childAspectRatio: 0.74,
          ),
          itemBuilder: (context, index) => MovieWidget(movie: movies[index]),
        ),
      ),
    );
  }
}
