import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MintTextTheme {
  static TextTheme getTextTheme(Color textColor) {
    return TextTheme(
      headlineLarge: GoogleFonts.sourceSans3(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleLarge: GoogleFonts.sourceSans3(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleMedium: GoogleFonts.sourceSans3(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleSmall: GoogleFonts.sourceSans3(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.sourceSans3(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.sourceSans3(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodySmall: GoogleFonts.sourceSans3(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      labelLarge: GoogleFonts.sourceSans3(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
