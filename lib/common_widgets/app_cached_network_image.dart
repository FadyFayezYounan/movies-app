import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../constants.dart';


import 'app_icon.dart';
import 'app_sized_box.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit boxFit;

  const AppCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius: 0.0,
    this.boxFit : BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: boxFit,
          // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          placeholder: (context, url) => Container(
            // color: Colors.grey,
            padding: EdgeInsets.all(KAppPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: AppIcon(
              iconName: IconName.image,
              size: 64,
              iconColor: Theme.of(context).accentColor.withOpacity(0.5),
            ),
          ),
          errorWidget: (context, url, error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                iconName: IconName.infoSquare,
                size: 64,
                iconColor: Color(0xFFE57373),
              ),
              AppHSizedBox(),
              Text(
                'Something Went Wrong!!',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
