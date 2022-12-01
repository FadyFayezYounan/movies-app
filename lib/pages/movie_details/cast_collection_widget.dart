import 'package:flutter/material.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_cast_and_crew_model.dart';
import 'package:my_movie_app/pages/movie_details/movie_cast_widget.dart';
import 'package:sizer/sizer.dart';




class CastCollectionWidget extends StatelessWidget {
  final List<Cast> cast;
  final String title;
  final Color? titleColor;
  final bool showLeading;


  const CastCollectionWidget({
    Key? key,
    required this.cast,
    required this.title,
    this.showLeading: false,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      height: 40.h,
      color: Color(0xFF212121),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile(
          //   //contentPadding: Ed,
          //   leading: Container(
          //     width: 4,
          //     color: appTheme.primaryColor,
          //   ),
          //   title: Text(
          //     title,
          //     style: appTheme.textTheme.headline5!.copyWith(
          //           color: Theme.of(context).primaryColor,
          //         ),
          //   ),
          //   trailing: TextButton(
          //     child: Text(
          //       'see more',
          //       style: appTheme.textTheme.bodyText1,
          //     ),
          //     onPressed: (){},
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  if (showLeading == true)
                    Container(
                      width: 4.0,
                      margin: EdgeInsets.only(
                        right: 8.0,
                        top: 4.0,
                        bottom: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.primaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  Text(
                    title,
                    style: appTheme.textTheme.headline5!.copyWith(
                      color: titleColor??Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    child: Text(
                      'see all',
                      style: appTheme.textTheme.bodyText1,
                    ),
                    onPressed: () {
                      // TODO: show all movie vertically in gridView in another page.
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              //physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: KAppPadding,
                right: KAppPadding,
                bottom: KAppPadding,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: cast.length >= 10 ? 10 : cast.length,
              itemBuilder: (context, index) => MovieCastWidget(
                cast: cast[index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(
                width: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
