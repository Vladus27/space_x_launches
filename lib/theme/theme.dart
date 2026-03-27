import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static const background = Color(0xFF000000);
  static const fill = Color(0xFF1C1C1C);
  static const accent = Color(0xFFBAFC54);
  static const title = Color(0xFFFFFFFF);
  static const element = Color(0xFFFFFFFF);
  static const caption = Color(0xFFC5C5C5);
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: SpaceXColors.background,
  colorScheme: const ColorScheme.dark(
    primary: SpaceXColors.accent,
    surface: SpaceXColors.fill,
    onSurface: SpaceXColors.element,
  ),

  cardColor: SpaceXColors.fill,
  textTheme: TextTheme(
    // default text
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.0,
      color: SpaceXColors.caption,
    ),

    // Title 2
    bodyLarge: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 1.0,
      color: SpaceXColors.title,
    ),

    // Title 1
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 1.3,
      color: SpaceXColors.accent,
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 1.3,
      color: SpaceXColors.title,
    ),
    titleSpacing: 20,
    backgroundColor: SpaceXColors.background, // або AppColors.background
    elevation: 0,
    centerTitle: true,
  ),
);
