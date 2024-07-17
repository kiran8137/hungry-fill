import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
            SizedBox(
               
            child: Image.asset('assets/3697355.png'),
          ),

          const SizedBox(
            child: Text('Explore,Order and Enjoy',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
            
          ),

           const  SizedBox(
            child: Text('Your Favorite Meals',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
            
          )
        ],
      )),
    );
  }
}
