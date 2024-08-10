
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishHeader extends StatelessWidget {
  const DishHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
           // height: 40,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white,
             
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 25),
                Text(
                  "#",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 280),
                Text(
                  "Dish",
                  style: GoogleFonts.inter(fontSize: 20,
                  fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 180),
                Text(
                  "Price",
                  style: GoogleFonts.inter(fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 137),
                Text(
                  "Serves",
                  style: GoogleFonts.inter(fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 150),
                Text(
                  "Stock",
                  style: GoogleFonts.inter(fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          );
  }
}