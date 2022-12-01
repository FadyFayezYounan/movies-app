import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/movies_search_class.dart';

import 'package:my_movie_app/pages/home/popular_movies_widget.dart';
import 'package:my_movie_app/pages/home/top_rated_movies_widget.dart';
import 'package:my_movie_app/pages/home/upcoming_movies_widget.dart';
import 'package:my_movie_app/pages/movie_details/movie_banner_carousel_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MoviesSearch(
                    appBarColor: appTheme.appBarTheme.color,
                    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
                  ),
                );
              },
              icon: Icon(
                Icons.search_rounded,
              ),
              splashRadius: 20.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviesBannersCarouselSliderWidget(),
            UpcomingMoviesWidget(),
            TopRatedMoviesWidget(),
            PopularMoviesWidget(),
          ],
        ),
      ),
    );
  }
}


