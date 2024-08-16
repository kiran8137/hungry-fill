import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hungry_fill/core/color/colors.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DishDetail extends StatelessWidget {
  DishDetail({super.key});
  final PageController _pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.shopping_cart,color: Colors.white,),
        backgroundColor: primarycolor,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
        }),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios_new),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                width: double.infinity,
                color: Colors.grey,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pagecontroller,
                      children: [
                        Container(
                          height: 210,
                          width: double.infinity,
                          color: Colors.green,
                        ),
                        Container(
                          height: 210,
                          width: double.infinity,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 210,
                          width: double.infinity,
                          color: Colors.red,
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: SmoothPageIndicator(
                        effect: const ExpandingDotsEffect(
                          dotHeight: 6,
                          dotWidth: 6,
                          //dotColor: Color.fromARGB(64, 14, 9, 45),
                          activeDotColor: primarycolor,
                        ),
                        controller: _pagecontroller,
                        count: 3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Dishname',
                style: GoogleFonts.rubik(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'non-veg',
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                   Text(
                    '1 serve',
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 285),
              Row(
                 
                children: [
                  Text('₹100',
                  style: GoogleFonts.anekDevanagari(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                 // SizedBox(width: 10,),
                   Container(
                    margin: EdgeInsets.only(),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                           "ADD" ,
                          style: GoogleFonts.abrilFatface(
                              color:  Colors.white ,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w400,
                                  ),
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        ),
        );
  }
}
