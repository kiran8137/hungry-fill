import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text orderDetailText({required String text}) {
  return Text(
    text,
    style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.w600),
  );
}
