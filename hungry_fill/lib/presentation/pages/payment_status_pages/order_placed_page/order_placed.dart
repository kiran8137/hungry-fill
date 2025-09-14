
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
 
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didpop){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainPage()), (Route<dynamic> route) => false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                 left: 0,
                 right: 0,
                 top: 100,
                child: SizedBox(
                  height: 250,
                  width: 250,
                  //color: Colors.grey,
                  child: Lottie.network("https://lottie.host/ef252a67-cc33-4d4d-9fc6-1f55989a2c29/L3vmSujRGI.json"),
                ),
              ),
      
      
              Positioned(
                 left: -30,
                  
                  bottom: 270,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  //color: Colors.grey,
                  child: Lottie.network("https://lottie.host/3c8d992e-4a24-488e-9c84-410b5b3156ca/StaThEIV87.json"),
                ),
              ),
              
      
               Positioned(
                 left: 80,
                 
                  
                  bottom: 200,
                child: SizedBox(
                  height: 150,
                  
                  //color: Colors.grey,
                  child: Text("Order Placed Successfully",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ).animate(
                    effects: [
                                     
                      const FadeEffect(),
                    ]
                  ),
                ),
              ),
      
      
              Positioned(
                bottom: 150,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainPage()) , ModalRoute.withName('/'));
                    },
                    child: Column(
                      children: [
                        Container(
                         
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                             color: AppColors.primaryColor,
                             borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Icon(Icons.arrow_back , color: Colors.white,),
                        ),

                        Text('Go Back To Home',style: GoogleFonts.openSans(),)
                      ],
                    ),
                  ),
                )
                )
               
            ],
          ),
        ),
      ),
    );
  }
}