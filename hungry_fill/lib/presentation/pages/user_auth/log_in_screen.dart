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
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/components/components_recentorders.dart';
import 'package:hungry_fill/presentation/pages/user_auth/reset_password_screen.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

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
      backgroundColor: const Color.fromARGB(30, 30, 46, 1),
      body: SafeArea(
        
          child: BlocConsumer<AuthBloc, AuthState>(
          
            listener: (context, state) {
              //  if(state is AuthInitial){
              //     const Center(child: CircularProgressIndicator());
              // }
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
                          borderRadius: BorderRadius.circular(10)
                          ),
                      child: Center(
                        child: Text(
                            style: GoogleFonts.aBeeZee(fontSize: 15),
                            "No user found in this number",
                            ),
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
                
                children: [
                    SizedBox(
                    height: 30.h,
                  ),
                  
                  CustomText(
                    text: 'Log In',
                    fontSize: 30.sp,
          
                    ),
                    
                   CustomText(
                    text: 'Please sign in to your existing account',
                    fontSize: 16.sp,
                    ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                    height: 10.h,
                  ),
                    Form(
                      key: _formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              SizedBox(
                              height: 40.h,
                            ),
                            CustomText(
                              text: 'EMAIL',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                            CustomTextFormWidget(
                              controller: emailcontrollerlogin,
                              hinttext: "example@gmail.com",
                               validator: (value){
                                   final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                   if(!regex.hasMatch(value!)){
                                    return "Enter a valid email";
                                   }
                                },
                            ),
                              SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                              text: 'PASSWORD',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (previous, current) => current is HideTextSuccessState,
                              builder: (context, state) {
                                final bool isTextHide = state is HideTextSuccessState ? state.isTextHide : true;
                                return CustomTextFormWidget(
                                                          controller: passwordcontrollerlogin,
                                                          hinttext: 'password',
                                                          suffixIconEnabled: true,
                                                          suffixIconOnTap: () {
                                                            context.read<AuthBloc>().add(HideTextEvent(currentBool: !isTextHide));
                                                          },
                                                          isObscureText:  isTextHide,
                                                            validator: (value){
                                   final regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                   if(!regExp.hasMatch(value!)){
                                    return "Password must be at least 8 characters long, include "
                                    "an uppercase letter, a lowercase letter, a number, and a special character";
                                   }
                                },
                                                        );
                              },
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // CustomText(
                                //         text: 'Remember me',
                                //         fontSize: 13.sp,
                                //         color: const Color.fromRGBO(
                                //             123, 138, 151, 1),
                                //       ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen()));
                                  },
                                  child: CustomText(
                                          text: 'Forgot Password',
                                          fontSize: 14.sp,
                                          color: AppColors.primaryColor
                                        ),
                                ),
                              ],
                            ),
                              SizedBox(
                              height: 50.h,
                            ),
          
                            GestureDetector(
                              onTap: () {
                                log("tapped log in");
                                if(_formkey.currentState!.validate()){
                                  BlocProvider.of<AuthBloc>(context).add(LogInEvent(emailid: emailcontrollerlogin.text , password: passwordcontrollerlogin.text ));
                                }
                                
                                
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                height: 62.h,
                                width:  double.infinity,
                                child: Center(
                                  child: CustomText(
                                    text: 'LOG IN',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Don't have a account ?",
                        fontSize: 16.sp,
                        color: Color.fromRGBO(100, 105, 130, 1),
                        ),
                      // const Text("Don't have a account ?",
                      //     style: TextStyle(
                      //         color: Color.fromARGB(255, 118, 118, 118))),
                        SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                        },
                        child:  CustomText(
                                    text: 'SIGN UP',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                    )
                      )
                    ],
                  )
                        ],
                      ),
                    ),
                  )
                  
                ],
              );
            },
          )),
    );
  }
}
