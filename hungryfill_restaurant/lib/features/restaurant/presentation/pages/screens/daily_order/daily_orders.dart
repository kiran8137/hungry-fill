import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';

class DailyOrders extends StatelessWidget {
  DailyOrders({super.key, this.index});

  final int? index;

  final tablecontents = [
    "Date"
        "Date",
    "Customer Name",
    "Total",
    "Order Status"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Daily Orders',
          style: GoogleFonts.radioCanada(
              fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: dailyOrdersBar(),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                        )
                        ),
                // width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 1250,
                        // color: Colors.blue,
                        child: dishDetailTable(tablecontents),
                      ),
                    ),

                   const Divider()
        ],
      ),
              )
            )
    )
        ]
      )
    );
     
  }

} 