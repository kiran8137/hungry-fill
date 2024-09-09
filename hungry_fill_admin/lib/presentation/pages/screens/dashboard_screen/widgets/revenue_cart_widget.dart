import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
 

class RevenueCardWidget extends StatelessWidget {
  const RevenueCardWidget({super.key, required this.title, required this.amount, required this.image});

  final String title;
  final String amount;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 130,
              width: 280,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.40),
                        spreadRadius: -9,
                        blurRadius: 9,
                        offset: const Offset(5, 15))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(image)),
                          shape: BoxShape.circle, color: Colors.blue),
                          
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.barlow(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: primarycolor),
                        ),
                        SizedBox(height: 10),
                        Text(
                          amount,
                          style: GoogleFonts.barlow(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: primarycolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

  }
}