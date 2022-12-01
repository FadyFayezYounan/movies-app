import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';
import 'package:my_movie_app/common_widgets/app_icon.dart';
import 'package:my_movie_app/common_widgets/app_icon_button.dart';
import 'package:my_movie_app/models/movie_model.dart';

Future<void> showMovieSmallDetails(
    {required BuildContext context, required Movie movie}) async {
  final appTheme = Theme.of(context);
  await showModalBottomSheet(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      //elevation: 0.0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  //margin: const EdgeInsets.all(KAppPadding / 2),
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AppCachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    '${movie.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    '${movie.releaseDate}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: AppIconButton(
                    onPressed: () {},
                    iconName: IconName.heartFilled,
                  ),
                ),
                buildMovieThreeInformation(movie, context),
                //AppHSizedBox(),
                buildMovieDescriptionWidget(movie, context),
                //AppHSizedBox(),
              ],
            ),
          ),
        );
      });
}

ListTile buildMovieDescriptionWidget(Movie movie, BuildContext context) {
  return ListTile(
    title: Text('Description:'),
    subtitle: Text(
      '${movie.overview}',
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}

Widget buildMovieThreeInformation(Movie movie, BuildContext context) {
  return IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildVoteCountWidget(movie, context),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: VerticalDivider(
            color: Colors.grey,
          ),
        ),
        buildRatingWidget(movie, context),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: VerticalDivider(
            color: Colors.grey,
          ),
        ),
        buildLanguageWidget(movie, context),
      ],
    ),
  );
}

Column buildLanguageWidget(Movie movie, BuildContext context) {
  return Column(
    children: [
      Text('Language'),
      const SizedBox(
        height: 4.0,
      ),
      Text(
        '${movie.originalLanguage}',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ],
  );
}

Column buildVoteCountWidget(Movie movie, BuildContext context) {
  return Column(
    children: [
      Text('Vote Count'),
      const SizedBox(
        height: 4.0,
      ),
      Text(
        '${movie.voteCount}',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ],
  );
}

Widget buildRatingWidget(Movie movie, BuildContext context) {
  return Column(
    children: [
      Text('Rating'),
      const SizedBox(
        height: 4.0,
      ),
      Row(
        children: [
          AppIcon(
            iconName: IconName.starFilled,
            size: 10,
            iconColor: Colors.yellowAccent,
          ),
          Text(
            ' ${movie.voteAverage}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            '/10',
          ),
        ],
      ),
    ],
  );
}

//Chip(
//                 backgroundColor: appTheme.scaffoldBackgroundColor,
//
//                 avatar: AppIcon(
//                   iconName: IconName.starFilled,
//                   size: 10,
//                   iconColor: Colors.yellowAccent,
//                 ),
//                 label: Text('${movie.voteAverage}'),
//               )
