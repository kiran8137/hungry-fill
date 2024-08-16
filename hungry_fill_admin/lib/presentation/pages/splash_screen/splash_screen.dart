import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/presentation/pages/auth_screens/sign_in.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/main_screen.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }


  Future<void> checkLogin() async{
    final result = await Provider.of<AuthProvider>(context,listen: false).getUserStatus();
    if (result == true) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:

            // Timer(
            //   const Duration(seconds: 3),
            //   ()=> Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> const MainScreen()))
            //   );

            // Timer(
            //   const Duration(seconds: 3),
            //   ()=> Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> const SignInScreen()))
            //   );

            Center(
          child: AnimatedOpacity(
            duration: const Duration(
                milliseconds: 300), // Duration for the opacity animation
            opacity: 1,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  // image: DecorationImage(image: AssetImage("assets/hung.png")
                  // )
                  ),
            ),
          ),
        ));
  }
}
