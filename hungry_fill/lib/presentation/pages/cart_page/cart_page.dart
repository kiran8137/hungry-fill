
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
            bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color:  const Color.fromARGB(189, 14, 9, 45),
          height: 1,
        ),
        ),

          title: Text(
            'Your Cart',
            style: GoogleFonts.abhayaLibre(),
          ),
          centerTitle: true,
        ),
      backgroundColor: Colors.white,
      body:    SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
          
              ListView.separated(
                separatorBuilder: (context, index)=>Divider(),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context , index){
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  );
                  
                }
                ),
                SizedBox(height: 10,),
          
                 Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
          
                   SizedBox(height: 10,),
          
                 Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  )
              
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder:(context , index){
              //     return Container(
              //       height: 100,
              //       width: 100,
              //       color: Colors.red,
              //     );
              //   }
              //   )
            ],
          ),
        ),
      )
    );
  }
}