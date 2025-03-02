import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/shared_preferences_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/theme/is_dark_theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferencesService _service;

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider(this._service) {
    _loadTheme();
  }

  void _loadTheme() {
    final isDarkTheme = _service.getIsDarkThemeValue().themeMode;
    _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final newTheme =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _themeMode = newTheme;
    await _service.saveIsDarkThemeValue(
        IsDarkThemeModel(themeMode: newTheme == ThemeMode.dark));
    notifyListeners();
  }
}
