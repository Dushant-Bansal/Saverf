import 'package:flutter/foundation.dart';

class BottomBarProvider extends ChangeNotifier {
  int _selected = 0;

  int get selectedIndex => _selected;

  void setSelectedIndex(int index) {
    _selected = index;
    notifyListeners();
  }
}
