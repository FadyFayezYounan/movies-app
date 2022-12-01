import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';
import 'package:my_movie_app/models/movie_cast_and_crew_model.dart';
import 'package:sizer/sizer.dart';

class MovieCastWidget extends StatelessWidget {
  final Cast cast;

  const MovieCastWidget({
    Key? key,
    required this.cast,
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
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
              child: cast.profilePath != null
                  ? AppCachedNetworkImage(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.64,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/${cast.profilePath}',
                      boxFit: BoxFit.cover,
                    )
                  : cast.gender == 1
                      ? Image.asset(
                          'assets/images/women_place_holder.png',
                          height: constraints.maxHeight * 0.64,
                          width: constraints.maxWidth,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/man_place_holder.png',
                          height: constraints.maxHeight * 0.64,
                          width: constraints.maxWidth,
                          fit: BoxFit.cover,
                        ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            buildCastName(
              context: context,
              constraints: constraints,
              castName: cast.name!,
            ),
            buildCastCharacter(
              constraints: constraints,
              context: context,
              castCharacter: cast.character!,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCastName(
      {required BoxConstraints constraints,
      required BuildContext context,
      required String castName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: constraints.maxHeight * 0.13,
        child: Text(
          '$castName',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget buildCastCharacter(
      {required BoxConstraints constraints,
      required BuildContext context,
      required String castCharacter}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: constraints.maxHeight * 0.15,
        child: Text(
          '$castCharacter',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
