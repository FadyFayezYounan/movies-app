import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_icon.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;

  const ShimmerWidget({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width ?? 100,
        height: height ?? 100,
        //margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          color: Colors.grey,
        ),
      ),
    );
  }
}
