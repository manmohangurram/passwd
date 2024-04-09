import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwd/common/theme/system_theme.dart';

class DefaultTheme implements SystemTheme {
  @override
  ThemeData getTheme() {
    return ThemeData(
        primaryColorDark: Colors.black26,
        dialogBackgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
        primaryColor: Colors.green.shade600,
        primaryIconTheme: IconThemeData(),
        iconButtonTheme: IconButtonThemeData(style: ButtonStyle()),
        primaryTextTheme: GoogleFonts.latoTextTheme(TextTheme(
            titleLarge: TextStyle(
                color: Colors.green.shade600,
                fontSize: 32,
                fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(
                color: Colors.green.shade500,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            bodySmall: TextStyle(
                color: Colors.green.shade300,
                fontSize: 16,
                fontWeight: FontWeight.w400))),
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
            titleLarge: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            bodySmall: TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.w400))));
  }
}
