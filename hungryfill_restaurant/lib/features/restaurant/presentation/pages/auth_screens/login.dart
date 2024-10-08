import 'package:flutter/material.dart';

 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/reset_password.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/sign_in.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/main_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _fomrkey = GlobalKey<FormState>();
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
      body: LayoutBuilder(
        builder: (context, constraints) {
           double screenWidth = constraints.maxWidth;
      double screenHeight = constraints.maxHeight;
        
         return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
             if(state is LogInSuccessState){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainScreen()), (Route<dynamic> predicate)=>false);
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Log In",
                          style: GoogleFonts.copse(fontSize: screenWidth<600 ? 40 :55),
                        ),
                        Form(
                          key: _fomrkey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value) {
                                   final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                   if(!regex.hasMatch(value!)){
                                    return "Enter a valid email";
                                   }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // controller: emailcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Email Id",
                                ),
                              ),
                                SizedBox(
                                height: screenHeight *0.02 ,
                              ),
                              TextFormField(
                                validator:
                                   (value){
                                   final regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                   if(!regExp.hasMatch(value!)){
                                    return "Password must be at least 8 characters long, include "
                                    "an uppercase letter, a lowercase letter, a number, and a special character";
                                   }
                                
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                 controller: passwordcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Password",
                                ),
                              ),
                                SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(_fomrkey.currentState!.validate()){
                                      BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                                      emailid: emailcontroller.text,
                                      password: passwordcontroller.text));
                                  }
                                
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primarycolor),
                                  height: 55,
                                  //width: 350,
                                  child: Center(
                                    child: Text(
                                      'Log In',
                                      style: GoogleFonts.breeSerif(
                                          color: Colors.white, fontSize: screenWidth<600 ? 25 : 30 ),
                                    ),
                                  ),
                                ),
                              ),
                                SizedBox(
                                height: screenHeight * 0.02,
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                                    },
                                    child: const Text(
                                      "forget Password",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 26, 115, 188)),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have a account ?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                    SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 26, 115, 188)),
                                      ))
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
        }
      ),
    );
  }
}
