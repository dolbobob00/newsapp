import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF2196F3),
      onPrimary: Colors.white,
      secondary: const Color(0xFF03A9F4),
      surface: Colors.white,
      error: const Color(0xFFB00020),
    ),
    scaffoldBackgroundColor: Colors.grey[50],
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF2196F3),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.0,
          fontFamily: 'Ubuntu',
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          fontFamily: 'Ubuntu',
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
          fontFamily: 'Ubuntu',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
          fontFamily: 'Ubuntu',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.1,
          fontFamily: 'Ubuntu',
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.3,
          letterSpacing: 0.1,
          fontFamily: 'Ubuntu',
        )),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF2196F3),
      textTheme: ButtonTextTheme.primary,
      shape: StadiumBorder(),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF64B5F6),
      secondary: const Color(0xFF81D4FA),
      onPrimary: Colors.white,
      surface: const Color(0xFF1E1E1E),
      error: const Color(0xFFCF6679),
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFF1E1E1E),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.0,
          color: Colors.white,
          fontFamily: 'Ubuntu',
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: Colors.grey[100],
          fontFamily: 'Ubuntu',
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
          fontFamily: 'Ubuntu',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
          color: Colors.grey[300],
          fontFamily: 'Ubuntu',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.1,
          color: Colors.grey[400],
          fontFamily: 'Ubuntu',
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.3,
          letterSpacing: 0.1,
          fontFamily: 'Ubuntu',
        )),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF64B5F6),
      textTheme: ButtonTextTheme.primary,
      shape: const StadiumBorder(),
    ),
  );
}
