import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key, required this.buttontext, this.buttoncolor, this.buttontextcolor,
  });
final String buttontext;
final Color? buttoncolor ;
final Color? buttontextcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(buttontext,
            style: GoogleFonts.breeSerif(
                color: buttontextcolor, fontSize: 18)),
      ),
    );
  }
}