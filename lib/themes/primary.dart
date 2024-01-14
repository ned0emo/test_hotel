import 'package:flutter/material.dart';
import 'package:test_hotel/themes/theme.dart';

class PrimaryTheme extends ThemeTemplate {
  @override
  ThemeData get data => ThemeData(
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF0D72FF),
        surface: Colors.grey[100] ?? Colors.white,
        background: Colors.grey[100] ?? Colors.white,
        surfaceTint: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey[850],
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(horizontal: 0),
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white));
}
