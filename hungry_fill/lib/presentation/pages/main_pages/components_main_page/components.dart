
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBarMain() {
    return AppBar(
      
      backgroundColor: Colors.white,
      
        shape:   const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50)
          )
        ),
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color:  const Color.fromARGB(189, 14, 9, 45),
          height: 1,
        ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                 print("tapped location");
              },
              child: Text('Location',
              style: GoogleFonts.abhayaLibre(),
              ),
            ),
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(
                        6.1415926535897932 / 4,
                      ),
              child: const ImageIcon(AssetImage("assets/next.png"),color: Colors.black,))
            
          ],
        ),
        centerTitle: true,
    );
  }
 