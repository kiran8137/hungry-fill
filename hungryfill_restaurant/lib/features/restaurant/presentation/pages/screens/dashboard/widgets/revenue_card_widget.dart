import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';

class RevenueCardWidget extends StatelessWidget {
  const RevenueCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      height: 150,
       width: 250,
    decoration: BoxDecoration(
       color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(0.40),
              spreadRadius: -9,
              blurRadius: 9,
              offset: const Offset(5, 15)
            )
         ]
    ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Daily",
             style: GoogleFonts.barlow(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: primarycolor
             ),
             ),
         
             Text("10,000",
             style: GoogleFonts.barlow(
               color: primarycolor,
              fontSize: 30
             ),
             ),
           ],
         ),
       ),
     
    );
  }
}