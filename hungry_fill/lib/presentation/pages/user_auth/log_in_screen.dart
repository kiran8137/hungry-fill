import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/login_bloc/log_in_bloc_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';
import 'package:hungry_fill/presentation/pages/user_auth/widgets/text_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController mobilecontrollerlogin = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  bool isotpsend = false;

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

            if(state is UserNotRegisteredStateLogin){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
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

             if(state is OtpSentStateLogin){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "OTP Sent Successfully"),
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Log In',
                  style: GoogleFonts.copse(fontSize: 70, color: primarycolor),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: const Color.fromARGB(57, 158, 158, 158),
                  ),
                  height: 340,
                  width: 396,
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormWidget(
                            controller: mobilecontrollerlogin,
                            hinttext: "Mobile No",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormWidget(
                            controller: otpcontroller,
                            hinttext: 'OTP',
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              log("tapped log in");
                              BlocProvider.of<LogInBloc>(context).add(SendOtpEventLogin(phonenumber: mobilecontrollerlogin.text, context: context));
                              setState(() {
                                isotpsend = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primarycolor),
                              height: 55,
                              width: 381,
                              child: Center(
                                child: Text(
                                  isotpsend == true ? 'LOG IN' : 'Send OTP',
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a account ?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 118, 118, 118))),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                            fontSize: 15,
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
