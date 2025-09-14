import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(30, 30, 46, 1),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(30, 30, 46, 1),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (previous, current) => current is SendResetPasswordEmailSuccess || current is SendResetPasswordEmailError,
          listener: (context, state) {
            if(state is SendResetPasswordEmailError){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 38, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child:   Center(
                      child: CustomText(
                        text: 'Error..!,Please try again',
                        fontSize: 12.sp,
                        ),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
              );
            }
            if(state is SendResetPasswordEmailSuccess){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                        color:Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child:   Center(
                      child: CustomText(
                        text: 'Email send successfully',
                        fontSize: 12.sp,
                        ),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
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
                  text: 'Forgot Password',
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: _formKey,
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
                                  controller: emailController,
                                  hinttext: "example@gmail.com",
                                  validator: (value) {
                                    final regex = RegExp(
                                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                    if (!regex.hasMatch(value!)) {
                                      return "Enter a valid email";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                          SendResetPasswordEmail(
                                              email: emailController.text));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.primaryColor),
                                    height: 62.h,
                                    width: double.infinity,
                                    child: Center(
                                        child: CustomText(
                                      text: 'LOG IN',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     CustomText(
                        //       text: "Don't have a account ?",
                        //       fontSize: 16.sp,
                        //       color: Color.fromRGBO(100, 105, 130, 1),
                        //       ),
                        //     // const Text("Don't have a account ?",
                        //     //     style: TextStyle(
                        //     //         color: Color.fromARGB(255, 118, 118, 118))),
                        //       SizedBox(width: 10.w),
                        //     GestureDetector(
                        //       onTap: () {
                        //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                        //       },
                        //       child:  CustomText(
                        //                   text: 'SIGN UP',
                        //                   fontSize: 14.sp,
                        //                   fontWeight: FontWeight.bold,
                        //                   color: AppColors.primaryColor,
                        //                   )
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
