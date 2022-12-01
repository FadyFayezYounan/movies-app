import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'app_icon.dart';

class AppIconButton extends StatelessWidget {
  final String iconName;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double iconSize;
  final double splashRadius;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.iconName,
    this.iconColor,
    this.splashRadius : 20,
    this.iconSize : 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var color = iconColor == null ? Theme.of(context).accentColor: iconColor;
    return IconButton(
      onPressed: onPressed,
      icon: AppIcon(
        iconName: iconName,
        iconColor: iconColor,
        size: iconSize,
      ),
      splashRadius: splashRadius.sp,
    );
  }
}
