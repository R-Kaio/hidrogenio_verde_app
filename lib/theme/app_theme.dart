import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffafcfb),
      titleTextStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Colors.green,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xFFABF4B0)),
        foregroundColor: WidgetStateProperty.all(
          Colors.black.withAlpha(178),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 50),
        ),
      ),
    ),
    primaryColor: Colors.green,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(128),
      backgroundColor: const Color(0xFFABF4B0),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E3440),
      titleTextStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Color(0xFFD5FFC2),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFD5FFC2),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: Colors.white70,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xFFD5FFC2)),
        foregroundColor: WidgetStateProperty.all(
          Colors.black.withAlpha(178),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 50),
        ),
      ),
    ),
    primaryColor: Colors.green,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.black12,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(128),
      backgroundColor: const Color(0xFFD5FFC2),
    ),
    scaffoldBackgroundColor: const Color(0xFF2E3440),
  );
}
