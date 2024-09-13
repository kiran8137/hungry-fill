import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyOrderHeader extends StatelessWidget {
  const DailyOrderHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      width: double.infinity,
      
      decoration: const BoxDecoration(
        
         
        ),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("#",
            style: GoogleFonts.inter(
               fontSize: 20,
                  fontWeight: FontWeight.bold
            ),
            ),
            Text("Order",
            style: GoogleFonts.inter(
                fontSize: 20,
                  fontWeight: FontWeight.bold
            ),
            ),
            Text("Date",
            style: GoogleFonts.inter(
                fontSize: 20,
                  fontWeight: FontWeight.bold
            ),
            ),
            Text("Customer",
            style: GoogleFonts.inter(
                fontSize: 20,
                  fontWeight: FontWeight.bold
            ),
            ),
            Text("Total",
            style: GoogleFonts.inter(
               fontSize: 20,
                  fontWeight: FontWeight.bold
            ),),
            Text("Order Status",
            style: GoogleFonts.inter(
                fontSize: 20,
                  fontWeight: FontWeight.bold
            ),),
          ],
        ),
    );
  }
}