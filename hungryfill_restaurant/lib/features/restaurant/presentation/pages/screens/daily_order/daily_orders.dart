
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/header_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_orders_header.dart';

class DailyOrders extends StatelessWidget {
  const DailyOrders({super.key,   this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          HeaderWidget(),

           const Divider(),

        const SizedBox(height: 25,),

        Row(
          children: [

            const SizedBox(width: 20,),
            
             
            Text("DAILY ORDERS",
             style: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.bold, fontSize: 30),
            ) 


          ],
        ),

        const SizedBox(height: 45,),

        const DailyOrderHeader(),

        const Divider(),

        Container(
          width: 1300,
          height: 435,
         // color: Colors.green,
          child: const SizedBox(height: 70,),
        ),

        const SizedBox(height: 5,),

        
      ],

    );
  }
}

