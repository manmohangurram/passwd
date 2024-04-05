import 'package:flutter/material.dart';
import 'package:passwd/common/theme/system_theme.dart';

class DefaultTheme implements SystemTheme {
  @override
  ThemeData getTheme() {
    return ThemeData(
        primaryColorDark: Colors.black26,
        primaryColor: Colors.blueAccent.shade200,
        primaryTextTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.white, fontSize: 17),
            headlineSmall: TextStyle(color: Colors.white30, fontSize: 13)));
  }
}
