import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/onboarding_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     
     navigatetoOnboardingScreen(context);
    BlocProvider.of<AuthBloc>(context).add(UserLoggedStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            Timer(
                const Duration(seconds: 3),
                () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    )));
          }

          if (state is UserUnAuthenticated) {
            Timer(
                const Duration(seconds: 3),
                () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingMain(),
                    )));
          }
        },
        builder: (context, state) {
          return 
          Center(
            child: Image.asset("assets/Hung.png"),
          );
        },
      ),
      //  Center(
      //       child: Image.asset("assets/Hung.png"),
      //     )
    );
  }
}

void navigatetoOnboardingScreen(context) {
  Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingMain(),
          )));
}
