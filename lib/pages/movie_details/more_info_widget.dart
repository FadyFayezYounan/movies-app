import 'package:flutter/material.dart';

class MoreInfoWidget extends StatelessWidget {
  final String text;
  final String value;
  final IconData icon;

  const MoreInfoWidget({
    Key? key,
    required this.text,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text('$text'),
      trailing: Text('$value'),
    );
  }
}
