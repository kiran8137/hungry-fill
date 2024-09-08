
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_restauants.dart';




//floating action button
FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Icon(Icons.shopping_cart,color: Colors.white,),
      backgroundColor: primarycolor,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
      });
  }


//scaffoldMessenger
SnackBar scaffoldMessenger({required String message}) {
    return SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 38, 0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(message,
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                        ),
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            );
  }


Text headingText({required String text}) {
    return Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 123, 123, 123)),
                  );
  }