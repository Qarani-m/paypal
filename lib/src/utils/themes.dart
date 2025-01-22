import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color _primaryLightColor = Color(0xFF009CDE); // PayPal Blue
  static const Color _primaryDarkColor = Color(0xFF003087); // PayPal Dark Blue
  static const Color _accentBlue = Color(0xFF142C8E);
  static const Color _errorRed = Color(0xFFE31B23);
  
  // Light Theme Colors
  static const Color _lightBackground = Colors.white;
  static const Color _lightSurface = Color(0xFFF5F7FA);
  static const Color _lightText = Color(0xFF243656);
  static const Color _lightSecondaryText = Color(0xFF6B7280);
  
  // Dark Theme Colors
  static const Color _darkBackground = Color(0xFF121212);
  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _darkText = Colors.white;
  static const Color _darkSecondaryText = Color(0xFFABABAB);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _primaryLightColor,
    scaffoldBackgroundColor: Color(0xFFeff2f9),
    fontFamily: 'PayPalSans',
    colorScheme: ColorScheme.light(
      primary: _primaryLightColor,
      secondary: _accentBlue,
      surface: _lightSurface,
      background: _lightBackground,
      error: _errorRed,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: _lightText,
      onBackground: _lightText,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: _lightText,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: _lightText,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: _lightText,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        color: _lightSecondaryText,
        fontSize: 14.sp,
      ),
        bodySmall: TextStyle(
        color:Colors.black,
        fontSize: 9.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: _lightText),
      titleTextStyle: TextStyle(
        color: _lightText,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryLightColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _primaryLightColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorRed, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: CardTheme(
      color: _lightBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _primaryDarkColor,
    scaffoldBackgroundColor: _darkBackground,
    fontFamily: 'PayPalSans',

    colorScheme: ColorScheme.dark(
      primary: _primaryDarkColor,
      secondary: _accentBlue,
      surface: _darkSurface,
      background: _darkBackground,
      error: _errorRed,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: _darkText,
      onBackground: _darkText,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: _darkText,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: _darkText,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: _darkText,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: _darkSecondaryText,
        fontSize: 14,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: _darkText),
      titleTextStyle: TextStyle(
        color: _darkText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryDarkColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _primaryDarkColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorRed, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: CardTheme(
      color: _darkSurface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}