import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/styles/color_config.dart';
import 'package:multiplatformapp_project1_fundamental/styles/text_style_config.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorConfig.primarySwatch,
          accentColor: ColorConfig.accentColor,
          brightness: Brightness.light),
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorConfig.primaryDarkSwatch,
          accentColor: ColorConfig.accentDarkSwatch,
          brightness: Brightness.dark),
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStylesConfig.titleLarge,
      titleMedium: TextStylesConfig.titleMedium,
      titleSmall: TextStylesConfig.titleSmall,
      bodyMedium: TextStylesConfig.bodyLargeMedium,
      bodySmall: TextStylesConfig.bodyLargeRegular,
      labelSmall: TextStylesConfig.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleSmall,
    );
  }
}
