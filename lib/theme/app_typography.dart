import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle displayReading = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.96,
    height: 1.17,
  );

  static TextStyle headlineLg = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.32,
    height: 1.25,
  );

  static TextStyle headlineLgMobile = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
  );

  static TextStyle headlineMd = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle labelBold = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.7,
    height: 1.43,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );
}