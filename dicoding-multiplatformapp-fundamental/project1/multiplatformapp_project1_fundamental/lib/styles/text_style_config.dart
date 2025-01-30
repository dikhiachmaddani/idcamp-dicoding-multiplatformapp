import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStylesConfig {
  static final TextStyle _commonStyle = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static TextStyle titleLarge = _commonStyle.copyWith(
    fontWeight: FontWeight.w900,
    fontSize: 25,
  );

  static TextStyle titleMedium = _commonStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    letterSpacing: 0,
  );

  static TextStyle titleSmall = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );

  static TextStyle bodyLargeMedium =
      _commonStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w800);

  static TextStyle bodyLargeRegular = _commonStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.56,
  );

  static TextStyle labelSmall = _commonStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF272343));
}
