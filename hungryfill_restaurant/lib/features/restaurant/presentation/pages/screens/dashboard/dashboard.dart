
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/dishrepo_implement/dish_repo_impl.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/header_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dashboard/widgets/revenue_card_widget.dart';

class Dashboard extends StatelessWidget {
    Dashboard({super.key, this.index});
  
  final int? index;


  String? url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        HeaderWidget(index: index,),
        const Divider(),
        const SizedBox(
          height: 25,
        ),

        const SizedBox(height: 10,),

        Row(
          children: [

            const SizedBox(width: 20,),
            GestureDetector(
              onTap: () async{
                url = await getImage();
              },
              child: Text("DASHBOARD",
                style: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.bold, fontSize: 30
                ),
              ),
            ),


          ],
        ),

        const SizedBox(height: 45,),

        Row(
          children: [

            const SizedBox(width: 15,),
            Text("Here’s Your Revenue",
              style: GoogleFonts.barlow(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                color: primarycolor
              ),
            ),

            
          ],
        ),

        const SizedBox(height: 5,),

        SizedBox(
          height: 150,
         
            
           child: Padding(
             padding: const EdgeInsets.all(5.0),
             child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 50,),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder:(context , index)=>  const RevenueCardWidget()
             ),
           ),

        ),

        Container(
          height: 100,
          width: 100,
        color: Colors.green,
        child: Image.network(url.toString()),
        )
      ],

    );
  }
}