
  import 'package:flutter/material.dart';
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