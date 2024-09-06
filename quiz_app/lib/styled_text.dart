import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    this.fontSize,
    this.fontFamily = 'Mingzat',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final String text;
  final double? fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        fontFamily,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 24,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
