import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF7f13ec),
      background: const Color(0xFFF7F6F8),
      surface: Colors.white,
      onPrimary: Colors.white,
      onBackground: Colors.black,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F6F8),
    fontFamily: 'Noto Sans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontFamily: 'Noto Sans'),
      bodyMedium: TextStyle(fontFamily: 'Noto Sans'),
      bodySmall: TextStyle(fontFamily: 'Noto Sans'),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: Colors.white,
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7f13ec),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 4,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: Color(0xFFe5e7eb)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF7f13ec),
      background: const Color(0xFF191022),
      surface: const Color(0xFF191022),
      onPrimary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF191022),
    fontFamily: 'Noto Sans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontFamily: 'Noto Sans'),
      bodyMedium: TextStyle(fontFamily: 'Noto Sans'),
      bodySmall: TextStyle(fontFamily: 'Noto Sans'),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: const Color(0xFF191022),
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7f13ec),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 4,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: Color(0xFF374151)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
