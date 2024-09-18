import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_1.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_2.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  final PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          // PageView(
          //   controller: _pagecontroller,
          //   children: const [
          //     OnboardingScreen1(),
          //     // OnboardingScreen2(),
          //     // OnboardingScreen3(),
          //   ],
          // ),
           OnboardingScreen1(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
                        },
                        child: Text(
                          'SKIP',
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primarycolor),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      // SmoothPageIndicator(
                      //   effect: const ExpandingDotsEffect(
                      //     dotHeight: 6,
                      //     dotWidth: 6,
                      //     //dotColor: Color.fromARGB(64, 14, 9, 45),
                      //     activeDotColor: primarycolor,
                      //   ),
                      //   controller: _pagecontroller,
                      //   count: 3,
                      // ),
                      const SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: Image.asset("assets/next.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
