import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double?  fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const CustomText({super.key, required this.text, this.textStyle, this.fontSize, this.fontWeight, this.color, this.fontFamily, this.maxLines, this.overflow, this.textAlign});
  
  @override
  Widget build(BuildContext context) {
    return  Text(
      
      text,
      style: GoogleFonts.sen(fontSize: fontSize ?? 20.sp, color: color ??  Colors.white, fontWeight: fontWeight ?? FontWeight.normal),
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign ?? TextAlign.start,
      //  TextStyle(
      //   fontSize: fontSize ?? 15,
      //   fontFamily: fontFamily ?? "Poppins",
      //   color: color ?? Colors.white,
      //   fontWeight: fontWeight ?? FontWeight.w500
      // ),
    );
  }
}