import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  bool _standardDrawerActive = true;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  NavigationProvider();

  bool get standardDrawerActive => _standardDrawerActive;

  set standardDrawerActive(bool value) {
    _standardDrawerActive = value;
    notifyListeners();
  }

  void toggle() {
    _standardDrawerActive = !_standardDrawerActive;
    notifyListeners();
  }
}
