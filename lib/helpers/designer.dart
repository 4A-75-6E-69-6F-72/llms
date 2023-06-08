import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Designer {
  static TextStyle getTextStyle(
      double? fontSize, Color? color, FontWeight? fontWeight) {
    return GoogleFonts.nunito(
        fontSize: fontSize, color: color, fontWeight: fontWeight);
  }
}
