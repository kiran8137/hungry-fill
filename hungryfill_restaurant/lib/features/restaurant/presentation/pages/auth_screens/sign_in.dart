import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/login.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/textform_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/res_detail_add_screen/res_detail_add.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
            width: 500,
            height: 500,
            child: Image.asset(
              "assets/Hung.png",
              height: 500,
              width: 500,
            )),
      ),
      body:LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double screenHeight = constraints.maxHeight;
      return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SigInSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ResDetailAddScreen(
                        username: usernamecontroller.text,
                      )),
              (Route<dynamic> predicate) => false,
            );
          }

          if (state is ErrorState) {
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
                      style: GoogleFonts.aBeeZee(
                          fontSize: 15, color: Colors.white),
                      "The email address is already in use by another account",
                    ),
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }

          if (state is AuthInitial) {
            const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(

            children: [
              Positioned(
                top: screenHeight*0.1,
                right: screenWidth < 600 ? screenWidth * 0.07 : 300,
                child: SizedBox(
                  width: screenWidth < 600 ? screenWidth * 0.85 : 400,  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: GoogleFonts.copse(
                          fontSize: screenWidth < 600 ? 40 : 55,  
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),  
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormWidget(
                              texteditingcontroller: usernamecontroller,
                              hinttext: 'UserName',
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 4) {
                                  return "Fields should not be empty or must be 3 characters";
                                }
                              },
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextFormWidget(
                              texteditingcontroller: emailcontroller,
                              hinttext: "Email Id",
                              validator: (value) {
                                final regex = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                if (!regex.hasMatch(value!)) {
                                  return "Enter a valid email";
                                }
                              },
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextFormWidget(
                              texteditingcontroller: passwordcontroller,
                              hinttext: "Password",
                              validator: (value) {
                                final regExp = RegExp(
                                    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                if (!regExp.hasMatch(value!)) {
                                  return "Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character";
                                }
                              },
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            GestureDetector(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignInEvent(
                                        emailid: emailcontroller.text,
                                        password: passwordcontroller.text),
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: primarycolor),
                                height: 55,
                                child: Center(
                                  child: Text(
                                    'Sign UP',
                                    style: GoogleFonts.breeSerif(
                                        color: Colors.white,
                                        fontSize: screenWidth < 600 ? 25 : 30),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 26, 115, 188)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  ),
    );
  }
}

