
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body : SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
            SizedBox(
               
            child: Image.asset('assets/3697355.png'),
          ),
          SizedBox(
            child: CustomText(
             text:  'Free delivery offers',
             fontSize: 24.sp,
             fontWeight: FontWeight.w900,
             color: Color.fromRGBO(50, 52, 62, 1),
            ),
            
                      ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: CustomText(
               text:  'Get all your loved foods in one once place,you just place the orer we do the rest',
               fontSize: 16.sp,
                overflow: TextOverflow.visible,
                maxLines: 2,
               color: Color.fromRGBO(100, 105, 130, 1),
               textAlign: TextAlign.center,
              ),
           ),
          // const SizedBox(
          //   child: Text('Find Recipes, Share Your',
          //   style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          //   ),
            
          // ),

          //  const  SizedBox(
          //   child: Text('Creations, and Chat with',
          //   style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          //   ),
            
          // ),

          //  const SizedBox(
          //   child: Text('Fellow Foodies',
          //   style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          //   ),)
        ],
      )),
    );
  }
}