import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginfirebase/src/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.kanit(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: tDarkColor,
    ),
    headline2: GoogleFonts.kanit(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: tDarkColor,
    ),
    headline3: GoogleFonts.kanit(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    headline4: GoogleFonts.kanit(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    headline5: GoogleFonts.kanit(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: tDarkColor,
    ),
    headline6: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: tDarkColor,
    ),
    bodyText1: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
    bodyText2: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
  );
  
  static TextTheme dartTextTheme = TextTheme(
    headline1: GoogleFonts.kanit(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: tWhiteColor,
    ),
    headline2: GoogleFonts.kanit(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: tWhiteColor,
    ),
    headline3: GoogleFonts.kanit(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    headline4: GoogleFonts.kanit(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    headline5: GoogleFonts.kanit(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: tWhiteColor,
    ),
    headline6: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: tWhiteColor,
    ),
    bodyText1: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
    bodyText2: GoogleFonts.kanit(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
  );
}
