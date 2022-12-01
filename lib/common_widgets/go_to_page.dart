

import 'package:flutter/material.dart';

void goToThisPage(BuildContext context , Widget page){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}