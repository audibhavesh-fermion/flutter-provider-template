import 'package:flutter/material.dart';
import 'package:flutter_provider_template/core/management/theme/color_schemes.dart';

enum AppTheme { Light, Dark }

class ThemeManager {
  static ThemeMode mode = ThemeMode.system;

  static final appThemeData = {
    AppTheme.Light:
        ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
    AppTheme.Dark: ThemeData(useMaterial3: true, colorScheme: darkColorScheme)
  };
}
