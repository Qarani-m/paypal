import 'package:flutter/material.dart';

class AppColors {




  // Primary Colors
  static const Color primaryColor = Color(0xFF009CDE);  // PayPal Blue
  static const Color primaryDarkColor = Color(0xFF003087);  // PayPal Dark Blue
  static const Color accentColor = Color(0xFF142C8E);  // PayPal Accent Blue




  static const Color scaffoldColorLight = Color(0xFF003087);  // PayPal Dark Blue







































  
  // Error & Success Colors
  static const Color errorColor = Color(0xFFE31B23);  // Error Red
  static const Color successColor = Color(0xFF169D62);  // Success Green
  static const Color warningColor = Color(0xFFFFB700);  // Warning Yellow
  
  // Light Theme Colors
  static const Color lightBackground = Colors.white;
  static const Color lightSurface = Color(0xFFF5F7FA);
  static const Color lightText = Color(0xFF243656);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color lightDivider = Color(0xFFEEEEEE);
  static const Color lightIcon = Color(0xFF6B7280);
  
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Colors.white;
  static const Color darkTextSecondary = Color(0xFFABABAB);
  static const Color darkBorder = Color(0xFF2A2A2A);
  static const Color darkDivider = Color(0xFF323232);
  static const Color darkIcon = Color(0xFFABABAB);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF009CDE),
    Color(0xFF003087),
  ];
  
  // Transparent & Overlay Colors
  static const Color transparent = Colors.transparent;
  static const Color shadowColor = Color(0x1A000000);
  static const Color overlayColor = Color(0x80000000);
  
  // Specific UI Element Colors
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color disabledColor = Color(0xFFD1D5DB);
  static const Color inputFillColor = Color(0xFFF9FAFB);
  
  // Status Colors
  static const Color onlineStatus = Color(0xFF34D399);
  static const Color offlineStatus = Color(0xFFD1D5DB);
  static const Color pendingStatus = Color(0xFFFCD34D);
  
  // Common Social Platform Colors
  static const Color facebookColor = Color(0xFF1877F2);
  static const Color googleColor = Color(0xFF4285F4);
  static const Color appleColor = Color(0xFF000000);
  
  // Money Transfer Related Colors
  static const Color moneyReceived = Color(0xFF059669);
  static const Color moneySent = Color(0xFFDC2626);
  static const Color moneyPending = Color(0xFFF59E0B);
  
  // Additional UI Colors
  static const Color cardShadow = Color(0x1A000000);
  static const Color tooltipBackground = Color(0xFF1F2937);
  static const Color badgeBackground = Color(0xFFEF4444);
  
  // Helper method for opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  // Helper method for creating MaterialColor
  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 0; i < strengths.length; i++) {
      final double ds = 0.5 - strengths[i];
      swatch[(strengths[i] * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}