import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/login_bloc/log_in_bloc_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontrollerlogin = TextEditingController();
  TextEditingController passwordcontrollerlogin = TextEditingController();
  

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(

          listener: (context, state) {

            if(state is LogInSuccessState){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainPage()), (Route<dynamic> predicate)=>false);
            }

            if(state is UserNotRegisteredStateLogin){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "No user found in this number"),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              );
            }

              
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Log In',
                  style: GoogleFonts.copse(fontSize: 70.sp, color: primarycolor),
                ),
                  SizedBox(
                  height: 60.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: const Color.fromARGB(57, 158, 158, 158),
                  ),
                  height: 340.h,
                  width: 396.w,
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                            SizedBox(
                            height: 40.h,
                          ),
                          TextFormWidget(
                            controller: emailcontrollerlogin,
                            hinttext: "Email",
                          ),
                            SizedBox(
                            height: 30.h,
                          ),
                          TextFormWidget(
                            controller: passwordcontrollerlogin,
                            hinttext: 'password',
                          ),
                            SizedBox(
                            height: 50.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              log("tapped log in");
                              BlocProvider.of<AuthBloc>(context).add(LogInEvent(emailid: emailcontrollerlogin.text , password: passwordcontrollerlogin.text ));
                              
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primarycolor),
                              height: 55.h,
                              width: 381.w,
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: GoogleFonts.breeSerif(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                  SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a account ?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 118, 118, 118))),
                      SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                      },
                      child:   Text("Sign Up",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.blue,
                          )),
                    )
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
