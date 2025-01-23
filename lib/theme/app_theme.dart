import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = _buildTheme(Brightness.light);
  static final darkTheme = _buildTheme(Brightness.dark);

  // Função para evitar repetição de lógica
  static ThemeData _buildTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      colorScheme: _buildColorScheme(brightness),
      appBarTheme: _buildAppBarTheme(isLight),
      textTheme: _buildTextTheme(isLight),
      elevatedButtonTheme: _buildElevatedButtonTheme(isLight),
      primaryColor: Colors.green,
      inputDecorationTheme: _buildInputDecorationTheme(isLight),
      bottomNavigationBarTheme: _buildBottomNavigationBarTheme(isLight),
      scaffoldBackgroundColor: isLight ? Colors.white : const Color(0xFF2E3440),
    );
  }

  // ColorScheme
  static ColorScheme _buildColorScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: brightness,
    );
  }

  // AppBarTheme
  static AppBarTheme _buildAppBarTheme(bool isLight) {
    return AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Roboto',
        color: isLight ? Colors.green : const Color(0xFFD5FFC2),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: isLight ? Colors.green : const Color(0xFFD5FFC2),
      ),
    );
  }

  // TextTheme
  static TextTheme _buildTextTheme(bool isLight) {
    return TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: isLight
            ? Colors.black87
            : Colors.white.withAlpha(178), // 70% opacidade
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
        color: isLight ? Colors.black : Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: isLight ? Colors.black : Colors.white,
      ),
    );
  }

  // ElevatedButtonTheme
  static ElevatedButtonThemeData _buildElevatedButtonTheme(bool isLight) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return isLight
              ? const Color(0xFFABF4B0) // Fundo para modo claro
              : const Color(0xFFD5FFC2); // Fundo para modo escuro
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return Colors.black
              .withAlpha(178); // Texto preto no modo claro e escuro
        }),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 50), // Largura e altura padrão
        ),
      ),
    );
  }

  // InputDecorationTheme
  static InputDecorationTheme _buildInputDecorationTheme(bool isLight) {
    return InputDecorationTheme(
      fillColor:
          isLight ? Colors.white : Colors.black.withAlpha(13), // 5% opacidade
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
      ),
    );
  }

  // BottomNavigationBarTheme
  static BottomNavigationBarThemeData _buildBottomNavigationBarTheme(
      bool isLight) {
    return BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(128),
      backgroundColor:
          isLight ? const Color(0xFFABF4B0) : const Color(0xFFD5FFC2),
    );
  }
}
