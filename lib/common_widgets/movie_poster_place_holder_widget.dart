import 'package:flutter/material.dart';

import 'app_icon.dart';

class MoviePosterPlaceHolderWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const MoviePosterPlaceHolderWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 100.0,
        height: height ?? 100.0,
        child: AppIcon(
          iconName: IconName.image,
          size: 64,
          iconColor: Theme.of(context).accentColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
