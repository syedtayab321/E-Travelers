import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final double letterSpacing;
  final double wordSpacing;
  final TextDecoration decoration;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.visible,
    this.maxLines,
    this.letterSpacing = 0.0,
    this.wordSpacing = 0.0,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}