import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({
    super.key,
    required this.title

  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inriaSans(
          fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}