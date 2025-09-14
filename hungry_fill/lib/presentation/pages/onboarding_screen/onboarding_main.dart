import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/onboarding_screen_bloc/onboarding_screen_bloc.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_1.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_2.dart';
import 'package:hungry_fill/presentation/pages/onboarding_screen/screens/onboarding_screen_3.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  final PageController _pagecontroller = PageController();
  List<Widget> pages = const [
    OnboardingScreen1(),
    //OnboardingScreen2(),
    OnboardingScreen3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            itemBuilder: (context, index) => pages[index],
            controller: _pagecontroller,
            itemCount: pages.length,
            onPageChanged: (value) {
              context
                  .read<OnboardingScreenBloc>()
                  .add(GetPageViewPageIndex(currentIndex: value));
            },
          ),
          // OnboardingScreen1(),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       SizedBox(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             GestureDetector(
          //               onTap: (){
          //                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
          //               },
          //               child: Text(
          //                 'SKIP',
          //                 style: GoogleFonts.inter(
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.bold,
          //                     color: AppColors.primaryColor),
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 2,
          //             ),
          // SmoothPageIndicator(
          //   effect:   ExpandingDotsEffect(
          //     dotHeight: 6,
          //     dotWidth: 6,
          //     //dotColor: Color.fromARGB(64, 14, 9, 45),
          //     activeDotColor: AppColors.primaryColor,
          //   ),
          //   controller: _pagecontroller,
          //   count: 3,
          // ),
          //             const SizedBox(
          //               width: 2,
          //             ),
          //             // SizedBox(
          //             //   width: 38,
          //             //   height: 38,
          //             //   child: Image.asset("assets/next.png"),
          //             // ),

          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
            buildWhen: (previous, current) => current is GetPageViewPageIndexSuccess,
            builder: (context, state) {
              final currentIndex = state is GetPageViewPageIndexSuccess ? state.index : 0;
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {  
                          currentIndex != pages.length-1 ?
                          _pagecontroller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease):
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LogInScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryColor),
                          height: 62.h,
                          width: double.infinity,
                          child: Center(
                              child: CustomText(
                            text: currentIndex == (pages.length-1) ? 'Get Started' : 'Next',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      currentIndex != (pages.length-1) ?
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LogInScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent),
                          height: 62.h,
                          width: double.infinity,
                          child: Center(
                              child: CustomText(
                            text: 'Skip',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          )),
                        ),
                      ) : 
                      SizedBox(height: 62.h,)
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
