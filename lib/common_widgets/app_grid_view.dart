import 'package:flutter/material.dart';

import '../constants.dart';

class AppGridView extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  const AppGridView({
    Key? key,
    required this.itemCount,
    this.crossAxisCount : 2,
    this.crossAxisSpacing : KAppPadding,
    this.mainAxisSpacing : KAppPadding,
    this.childAspectRatio : 0.74,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: KAppPadding),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Text('$index'),
    );
  }
}
