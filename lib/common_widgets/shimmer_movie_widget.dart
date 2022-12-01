import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_icon.dart';
import 'package:my_movie_app/common_widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovieWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;

  const ShimmerMovieWidget({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      //margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        color: Color(0xFF2A2A2A),
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
        builder: (BuildContext context, BoxConstraints constraints) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppIcon(
                    iconName: IconName.image,
                    size: 16,
                    iconColor:Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.04,
              ),
              ShimmerWidget(
                width: constraints.maxWidth * 0.84,
                height: constraints.maxHeight *0.04,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              ShimmerWidget(
                width: constraints.maxWidth * 0.64,
                height: constraints.maxHeight *0.04,
              ),
              Spacer(),
              Row(
                children: [
                  AppIcon(
                    iconName: IconName.starFilled,
                    size: 10,
                    iconColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  ShimmerWidget(
                    width: constraints.maxWidth * 0.24,
                    height: constraints.maxHeight *0.04,
                  ),
                  Spacer(),
                  ShimmerWidget(
                    width: constraints.maxWidth * 0.24,
                    height: constraints.maxHeight *0.04,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}