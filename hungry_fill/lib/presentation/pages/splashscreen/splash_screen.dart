import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/onboarding_main.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     
    // navigatetoOnboardingScreen(context);
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
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*0.25,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    Center(
                      child: Image.asset("assets/app_new_logo.png",
                        height: 150.h,
                        width: 150.w,
                      ),
                    ),
                    // AnimatedTextKit(
                    //   isRepeatingAnimation: false,
                    //   animatedTexts: [
                    //     RotateAnimatedText(
                    //       'Ruchi',
                    //       textStyle:  GoogleFonts.sen(
                    //             fontSize: 35.sp,
                    //             color: Colors.green,
                    //             fontWeight: FontWeight.bold,
                                 
                    //           )
                    //     )
                    //     ]
                    //   )
                      RichText(
                        text: TextSpan(
                          children: [
                             TextSpan(
                              text: 'Hungry',
                              style: GoogleFonts.sen(
                                fontSize: 35.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                 
                              )
                             ),
                              TextSpan(
                              text: '-Fill',
                              style: GoogleFonts.sen(
                                fontSize: 35.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold
                              )
                             )
                          ]
                        ),
                      )
                  ],
                ),
              ),
            ],
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
