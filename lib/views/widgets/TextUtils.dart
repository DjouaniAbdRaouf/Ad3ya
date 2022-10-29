// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtilsalmarai extends StatelessWidget {
  const TextUtilsalmarai(
      {Key? key,
      required this.label,
      required this.color,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  final String label;
  final Color color;
  final FontWeight fontWeight;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: TextAlign.center,
        style: GoogleFonts.almarai(
            color: color, fontSize: 22, fontWeight: FontWeight.bold));
  }
}
