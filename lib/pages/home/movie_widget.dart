import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';
import 'package:my_movie_app/common_widgets/app_icon.dart';
import 'package:my_movie_app/common_widgets/go_to_page.dart';
import 'package:my_movie_app/common_widgets/movie_poster_place_holder_widget.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/pages/home/movie_details_bottom_sheet.dart';
import 'package:my_movie_app/pages/movie_details/movie_details_page.dart';
import 'package:sizer/sizer.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A), //Color(0xFF1A1A1A),
        // borderRadius: BorderRadius.vertical(
        //   bottom: Radius.circular(8.0),
        // ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 16.0,
            spreadRadius: 4.0,
            offset: Offset(0.0, 16.0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            goToThisPage(
              context,
              MovieDetailsPage(
                movie: movie,
              ),
            );
          },
          onLongPress: () async {
            await showMovieSmallDetails(context: context, movie: movie);
          },
          borderRadius: BorderRadius.circular(8.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: movie.posterPath != null
                      ? AppCachedNetworkImage(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.7,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          boxFit: BoxFit.cover,
                        )
                      : MoviePosterPlaceHolderWidget(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.7,
                        ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                buildMovieTitle(constraints, context),
                buildMovieVoteAverageWidget(constraints),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMovieTitle(BoxConstraints constraints, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: constraints.maxHeight * 0.16,
        child: Text(
          '${movie.title}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget buildMovieVoteAverageWidget(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: constraints.maxHeight * 0.06,
        child: Row(
          children: [
            AppIcon(
              iconName: IconName.starFilled,
              size: 10,
              iconColor: Colors.yellowAccent,
            ),
            const SizedBox(
              width: 4.0,
            ),
            if(movie.voteAverage != null)
            Text('${movie.voteAverage!.toStringAsFixed(1)}'),
            //Text('  ${movie.id}  '),
            Spacer(),
            if (movie.releaseDate != '' && movie.releaseDate != null)
              Text('${movie.releaseDate!.substring(0, 4)}'),
            //https://api.themoviedb.org/3/movie/550988/videos?api_key=de3446f7f8e7be39b914abe7231a3839&language=en-US
          ],
        ),
      ),
    );
  }
}
