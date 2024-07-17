
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/header_widget.dart';

class DailyOrders extends StatelessWidget {
  const DailyOrders({super.key,   this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),

        const SizedBox(height: 25,),

        Row(
          children: [

            const SizedBox(width: 20,),
            
             
            Text("DAILY ORDERS",
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.bold,
                fontSize: 38
              ),
            ) 


          ],
        ),

        const SizedBox(height: 45,),

        SizedBox(
          width: 1300,
          height: 500,
         // color: Colors.green,
          child: Column(
            children: [

              const SizedBox(height: 70,),
              Container(
                height: 50,
                width: double.infinity,
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                       color: Colors.black.withOpacity(0.50),
              spreadRadius: -5,
              blurRadius: 10,
              offset: const Offset(1, 5)
                    )
                  ]),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("#",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),
                      ),
                      Text("Order",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),
                      ),
                      Text("Date",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),
                      ),
                      Text("Customer",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),
                      ),
                      Text("Total",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),),
                      Text("Order Status",
                      style: GoogleFonts.inter(
                        fontSize: 28
                      ),),
                    ],
                  ),
              )
            ],
          ),
        ),

        const SizedBox(height: 5,),

        
      ],

    );
  }
}