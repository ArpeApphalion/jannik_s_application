import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get black => Color(0xFF1E1E1E);
  Color get white => Color(0xFFFFFFFF);
  Color get gray300 => Color(0xFFD1D5DB);
  Color get gray400 => Color(0xFF9CA3AF);

  // Additional Colors
  Color get blackCustom => Colors.black;
  Color get whiteCustom => Colors.white;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFFF8F5 => Color(0xFFF8F5EF);
  Color get colorFF2E2E => Color(0xFF2E2E2E);
  Color get colorFFDDD6 => Color(0xFFDDD6C4);
  Color get colorFF3C6E => Color(0xFF3C6E47);
  Color get colorFFF0F0 => Color(0xFFF0F0F0);
  Color get colorFF9999 => Color(0xFF999999);
  Color get colorFF1F29 => Color(0xFF1F2937);
  Color get colorFF4376 => Color(0xFF437684);
  Color get colorFFE2F7 => Color(0xFFE2F7E1);
  Color get colorFFF6F7 => Color(0xFFF6F7E1);
  Color get colorFF3478 => Color(0xFF34784F);
  Color get colorFF8B7E => Color(0xFF8B7E2C);
  Color get colorFF7A76 => Color(0xFF7A766B);
  Color get colorFFE2DD => Color(0xFFE2DDD2);
  Color get colorFFCCCC => Color(0xFFCCCCCC);
  Color get colorFFADAE => Color(0xFFADAEBC);
  Color get colorFFF1EC => Color(0xFFF1ECE3);
  Color get colorFF6666 => Color(0xFF666666);
  Color get colorFF6C66 => Color(0xFF6C6652);
  Color get colorFFC9B7 => Color(0xFFC9B786);
  Color get colorFFB000 => Color(0xFFB00020);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
