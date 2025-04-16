import 'package:flutter/material.dart';

class MintColors {
  final Color scaffold;
  final Color surface;
  final Color foreground;
  final Color divider;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color icon;
  final Color textColor;
  final Color primaryText;
  final Color secondaryText;

  const MintColors({
    required this.scaffold,
    required this.surface,
    required this.foreground,
    required this.divider,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.icon,
    required this.textColor,
    required this.primaryText,
    required this.secondaryText,
  });
}

class MintColorPalette {
  static const light = MintColors(
    scaffold: Color(0xFFFFFFFF),
    surface: Color(0xFFEFEFEF),
    foreground: Color(0xFFFFFFFF),
    divider: Color(0xFFC0C0C0),
    primary: Color(0xFFFFFFFF),
    secondary: Color(0xFFA8A7A8),
    tertiary: Color(0xFFBB86FC),
    icon: Color(0xFF000000),
    textColor: Color(0xFF000000),
    primaryText: Color(0xFF000000),
    secondaryText: Color(0xFFA8A7A8),
  );

  static const dark = MintColors(
    scaffold: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    foreground: Color(0xFFFFFFFF),
    divider: Color(0xFF424242),
    primary: Color(0xFFBB86FC),
    secondary: Color(0xFF03DAC6),
    tertiary: Color(0xFF3700B3),
    icon: Color(0xFFBB86FC),
    textColor: Color(0xFFFFFFFF),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0xFFBDBDBD),
  );
}
