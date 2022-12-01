import 'package:flutter/foundation.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeCurrentIndexValue(int newValue) {
    currentIndex = newValue;
    notifyListeners();
  }
}
