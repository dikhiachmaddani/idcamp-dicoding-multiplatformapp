import 'package:flutter/material.dart';

class AppBarProvider with ChangeNotifier {
  Color _appBarBackgroundColor = Colors.transparent;

  Color get appBarBackgroundColor => _appBarBackgroundColor;

  void updateAppBarBackgroundColor(double offset, Color primaryColor) {
    _appBarBackgroundColor = offset > 10 ? primaryColor : Colors.transparent;
    notifyListeners();
  }
}
