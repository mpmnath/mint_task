import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  /// Get the current theme mode.
  ThemeMode get themeMode =>
      Theme.of(this).brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  // / Get design size based on device type.
  bool get isTablet {
    // Get the device's screen size and density
    final size = MediaQuery.of(this).size;
    final diagonalSize = sqrt(pow(size.width, 2) + pow(size.height, 2));
    final pixelRatio = MediaQuery.of(this).devicePixelRatio;

    // Calculate the physical screen size in inches
    final physicalWidth = size.width / pixelRatio;
    final physicalHeight = size.height / pixelRatio;
    final physicalSize = sqrt(pow(physicalWidth, 2) + pow(physicalHeight, 2));

    // Determine the device type based on the physical screen size
    return physicalSize >= 7 && diagonalSize >= 1100;
  }

  // Get colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Get textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
