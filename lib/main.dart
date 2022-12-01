import 'package:flutter/material.dart';
import 'package:my_movie_app/app_theme.dart';
import 'package:my_movie_app/landing_page.dart';
import 'package:my_movie_app/pages/main_page.dart';
import 'package:my_movie_app/providers/bottom_nav_bar_Provider.dart';
import 'package:my_movie_app/providers/categories_provider.dart';
import 'package:my_movie_app/providers/connection_state_provider.dart';
import 'package:my_movie_app/providers/movies_search_provider.dart';
import 'package:my_movie_app/providers/now_playing_movies_provider.dart';
import 'package:my_movie_app/providers/movies_details_provider.dart';
import 'package:my_movie_app/providers/popular_movies_provider.dart';
import 'package:my_movie_app/providers/top_rated_movies_provider.dart';
import 'package:my_movie_app/providers/upcoming_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MoviesDetailsProvider()),
        ChangeNotifierProvider.value(value: TopRatedMoviesProvider()),
        ChangeNotifierProvider.value(value: PopularMoviesProvider()),
        ChangeNotifierProvider.value(value: NowPlayingMoviesProvider()),
        ChangeNotifierProvider.value(value: UpcomingMoviesProvider()),
        ChangeNotifierProvider.value(value: BottomNavBarProvider()),
        ChangeNotifierProvider.value(value: MoviesSearchProvider()),
        ChangeNotifierProvider.value(value: CategoriesProvider()..fetchAndSetCategories()),
        ChangeNotifierProvider.value(value: ConnectionStateProvider()),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) =>
            MaterialApp(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme(),
          home: LandingPage(),
        ),
      ),
    );
  }
}

