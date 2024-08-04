import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key, this.restaurantname, this.restaurantplace, this.restaurantdistrict});

  final String? restaurantname;
  final String? restaurantplace;
  final String? restaurantdistrict;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.40),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 95,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantname!,
                    style: GoogleFonts.mukta(
                        fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  // Text(
                  //   restaurantplace!,
                  //   style: GoogleFonts.mukta(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w400
              
                  //   ),
                  //
                  //),
              
                  Row(
                    children: [
                      Text(
                        restaurantplace!,
                        style: GoogleFonts.jost(
                           color: const Color.fromARGB(255, 122, 121, 121),
                          fontSize: 15,
                        ),
                      ),
              
                      //Text(".",style: TextStyle(color: Colors.white , fontSize: 20),),
                      const Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        
                      ),
                      Text(
                        restaurantdistrict!,
                        style: GoogleFonts.jost(
                          color: const Color.fromARGB(255, 122, 121, 121),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
