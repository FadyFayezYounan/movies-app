import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/shimmer_movie_widget.dart';
import 'package:my_movie_app/common_widgets/shimmer_widget.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class ShimmerListView extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool showLeading;

  const ShimmerListView({
    Key? key,
    required this.title,
    this.showLeading: false,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context);
    return Container(
      height: 40.h,
      color: Color(0xFF212121),
      child: Column(
        children: [
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
                    buildLeadingContainer(appTheme),
                  Text(
                    title,
                    style: appTheme.textTheme.headline5!.copyWith(
                      color: titleColor??Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    child: Text(
                      'see more',
                      style: appTheme.textTheme.bodyText1,
                    ),
                    onPressed: () {
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: KAppPadding,
                right: KAppPadding,
                bottom: KAppPadding,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => ShimmerMovieWidget(
                width: 32.w,
                height: 32.h,
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

  Container buildLeadingContainer(ThemeData appTheme) {
    return Container(
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
                  );
  }
}
