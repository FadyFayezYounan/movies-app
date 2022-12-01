import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AppExpandableText extends StatelessWidget {
  final String text;
  final int maxLines;

  const AppExpandableText({
    Key? key,
    required this.text,
    this.maxLines : 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      '$text',
      expandText: 'show more',
      collapseText: 'show less',
      maxLines: maxLines,
      linkColor: Theme.of(context).primaryColor,
      animation: true,
      animationDuration: Duration(milliseconds: 750),
      //collapseOnTextTap: true,
      expandOnTextTap: true,
      //animationCurve: Curves.easeInOut,

    );
  }
}
