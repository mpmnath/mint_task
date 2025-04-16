import 'package:flutter/material.dart';
import 'package:mint/core/theme/color_palette.dart';
import 'package:mint/core/theme/text_theme.dart';

class MintTheme {
  static ThemeData get light => _buildTheme(Brightness.light);
  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors = isDark ? MintColorPalette.dark : MintColorPalette.light;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.scaffold,
      textTheme: MintTextTheme.getTextTheme(colors.textColor),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.scaffold,
        foregroundColor: colors.primaryText,
        titleTextStyle: MintTextTheme.getTextTheme(
          colors.primaryText,
        ).headlineLarge!.copyWith(color: colors.primaryText),
        iconTheme: IconThemeData(color: colors.icon),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colors.primaryText,
        unselectedLabelColor: colors.secondaryText,
        indicatorColor: colors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: MintTextTheme.getTextTheme(
          colors.primaryText,
        ).labelLarge!.copyWith(color: colors.primaryText),
        unselectedLabelStyle: MintTextTheme.getTextTheme(
          colors.secondaryText,
        ).labelLarge!.copyWith(
          color: colors.secondaryText,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
