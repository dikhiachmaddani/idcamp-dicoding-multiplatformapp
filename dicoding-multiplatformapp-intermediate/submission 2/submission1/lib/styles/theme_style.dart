import 'package:flutter/material.dart';
import 'package:submission1/styles/color_style.dart';
import 'package:submission1/styles/text_style.dart';

class ThemeStyle {
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ColorStyle.primaryDarkSwatch,
        accentColor: ColorStyle.accentDarkSwatch,
        brightness: Brightness.dark,
      ),
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ColorStyle.primarySwatch,
        accentColor: ColorStyle.accentColor,
        brightness: Brightness.light,
      ),
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(toolbarTextStyle: _textTheme.titleSmall);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyles.titleLarge,
      titleMedium: TextStyles.titleMedium,
      titleSmall: TextStyles.titleSmall,
      bodyMedium: TextStyles.bodyLargeMedium,
      bodySmall: TextStyles.bodyLargeRegular,
      labelSmall: TextStyles.labelSmall,
      labelMedium: TextStyles.labelMedium,
    );
  }
}
