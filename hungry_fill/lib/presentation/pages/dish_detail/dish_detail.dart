import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DishDetail extends StatelessWidget {
  const DishDetail({super.key, required this.images, required this.dish});
  //final PageController _pagecontroller = PageController();
  final List<String> images;
  final DishModel dish;

  
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
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: images.length, 
                itemBuilder:(context, index, realIndex) {
                  final image = images[index];
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // width: 350,
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(
                      //   color: Colors.green,
                      //   borderRadius: BorderRadius.circular(10)
                      // ),
                    
                      child: Image.network(image,
                      fit: BoxFit.cover,
                      ),
                    ),
                  );
                }, 
                options: CarouselOptions(
                  height: 210,
                  enlargeCenterPage: true
                  )
                ),
             
              const SizedBox(height: 30),
              Text(
                dish.dishname!,
                style: GoogleFonts.rubik(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   "${ dish.dishserve!} serve",
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                   Text(
                    ' ',//serve
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 30),

             Text("About Dish",
              style: GoogleFonts.rubik(
                fontSize: 18,
               // fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 44, 44, 44)

              ),
             ),
             Container(
              height: 200,
              width: double.infinity,
              //color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView(
                  children: [
                    Text(dish.dishdescription!,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 84, 84, 84)
                         
                    )
                    )
                  ],
                ),
              ),
             ),

             SizedBox(height: 25),
              Row(
                 
                children: [
                  Text('₹100',
                  style: GoogleFonts.anekDevanagari(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                  SizedBox(width: 6,),
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
