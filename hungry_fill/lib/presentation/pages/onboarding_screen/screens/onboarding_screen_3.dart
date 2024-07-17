
import 'package:flutter/material.dart';

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

          const SizedBox(
            child: Text('Find Recipes, Share Your',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
            
          ),

           const  SizedBox(
            child: Text('Creations, and Chat with',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
            
          ),

           const SizedBox(
            child: Text('Fellow Foodies',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),)
        ],
      )),
    );
  }
}