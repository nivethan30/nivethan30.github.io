import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark()
        .textTheme
        .apply(fontFamily: GoogleFonts.robotoMono().fontFamily),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0a192f),
      primary: const Color(0xFF0a192f),
    ),
    scaffoldBackgroundColor: const Color(0xFF0a192f),
  );
}
