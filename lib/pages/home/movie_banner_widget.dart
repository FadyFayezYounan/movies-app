import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/pages/movie_details/movie_details_page.dart';
import 'package:sizer/sizer.dart';

class MovieBannerWidget extends StatelessWidget {
  final Movie movie;

  const MovieBannerWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(
            movie: movie,
          ),
        ),
      );
    },
      child: SizedBox(
        height: 40.h,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            MovieBannerCoverImageWidget(
              coverImagePath: movie.backdropPath!,
            ),
            SizedBox(
              height: 24.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieBannerPosterImage(
                    posterImagePath: movie.posterPath!,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildMovieTitle(
                              context: context,
                              title: movie.title!,
                              releaseDate: movie.releaseDate!,
                            ),
                            //buildMovieGenres(),
                            Text(
                              '${movie.overview}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            MovieBannerSmallInfoWidget(
                              icon: Icons.star_rate_rounded,
                              value: '${movie.voteAverage!.toStringAsFixed(1)}',
                            ),
                            // MovieBannerSmallInfoWidget(
                            //   icon: Icons.schedule_rounded,
                            //   value: '115 m',
                            // ),
                            MovieBannerSmallInfoWidget(
                              icon: Icons.translate_rounded,
                              value: '${movie.originalLanguage}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieTitle({
    required BuildContext context,
    required String title,
    required String releaseDate,
  }) {
    return Text(
      '$title (${releaseDate.substring(0, 4)})',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget buildMovieGenres() {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
        MovieBannerGenres(),
      ],
    );
  }
}

class MovieBannerCoverImageWidget extends StatelessWidget {
  final String coverImagePath;

  const MovieBannerCoverImageWidget({
    Key? key,
    required this.coverImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppCachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/$coverImagePath',
          boxFit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black54,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieBannerPosterImage extends StatelessWidget {
  final String posterImagePath;

  const MovieBannerPosterImage({
    Key? key,
    required this.posterImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 24.h,
      margin: const EdgeInsets.only(
        left: 16.0,
        bottom: 16.0,
        //right: 8.0,
      ),
      child: AppCachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/w500/$posterImagePath',
        boxFit: BoxFit.cover,
        borderRadius: 4.0,
      ),
    );
  }
}

class MovieBannerGenres extends StatelessWidget {
  const MovieBannerGenres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 2.8,
          backgroundColor: Colors.white,
        ),
        const SizedBox(
          width: 2.0,
        ),
        Text('Comedy'),
        const SizedBox(
          width: 6.0,
        ),
      ],
    );
  }
}

class MovieBannerSmallInfoWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String value;

  const MovieBannerSmallInfoWidget({
    Key? key,
    required this.icon,
    this.iconColor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Theme.of(context).accentColor,
          size: 16.0,
        ),
        SizedBox(
          width: 4.0,
        ),
        Text('$value'),
      ],
    );
  }
}
