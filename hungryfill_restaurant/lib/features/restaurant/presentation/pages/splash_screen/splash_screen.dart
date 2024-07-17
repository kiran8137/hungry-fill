import 'dart:async';

import 'package:flutter/material.dart';
 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/sign_in.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/main_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/restaurant_user/restaurant_user_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    BlocProvider.of<RestaurantUserBloc>(context).add(RestuarantLoggedStatusEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<RestaurantUserBloc, RestaurantUserState>(
        listener: (context, state) {
          
          if(state is RestaurantAuthenticated){
            Timer(
              const Duration(seconds: 3), 
              ()=> Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> const MainScreen()))
              );
          }

          if(state is RestaurantUnAuthenticated){
            Timer(
              const Duration(seconds: 3), 
              ()=> Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> const SignInScreen()))
              );
          }
        },
        builder: (context, state) {
          return Center(
            child: AnimatedOpacity(
              duration: const Duration(
                  milliseconds: 300), // Duration for the opacity animation
              opacity: 1,
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/hung.png"))),
              ),
            ),
          );
        },
      ),
    );
  }
}
