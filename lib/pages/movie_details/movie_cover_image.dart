

import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';

class MovieCoverImage extends StatelessWidget {
  const MovieCoverImage({
    Key? key,
    required this.movieCoverPath,
    required this.movieTitle,
  }) : super(key: key);

  final String movieCoverPath;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          AppCachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500/$movieCoverPath',
            boxFit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black26,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          '$movieTitle',
          style: TextStyle(color: Colors.white),
          textScaleFactor: 0.8,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
      centerTitle: true,
    );
  }
}