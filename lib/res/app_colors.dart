import 'package:flutter/material.dart';
import 'package:flutter_provider_template/core/management/theme/theme_manager.dart';

class AppColors {
  //Hex Colors



  static int _getColorIntFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static Color getColor(String colorHex) {
    return Color(_getColorIntFromHex(colorHex));
  }



  static MaterialColor createPrimarySwatch(Color color) {
    // You can adjust the number of shades (from 50 to 900) based on your preference
    Map<int, Color> colorMap = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color,
    };

    return MaterialColor(color.value, colorMap);
  }
}
