import 'package:flutter/material.dart';

class FlavorConfig {
  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance ?? FlavorConfig();
  final FlavorType flavor;

  final MaterialColor color;

  final FlavorValues values;

  FlavorConfig({
    this.flavor = FlavorType.free,
    this.color = Colors.orange,
    this.values = const FlavorValues(),
  }) {
    _instance = this;
  }
}

enum FlavorType { free, paid }

class FlavorValues {
  final String titleApp;

  const FlavorValues({this.titleApp = "Masto App"});
}
