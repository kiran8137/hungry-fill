import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/login.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/textform_widget.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
           if(state is SigInSuccessState){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>   ResDetailAddScreen(username: usernamecontroller.text,)), (Route<dynamic> predicate)=>false);
           }

           if(state is ErrorState){
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
                          style: GoogleFonts.aBeeZee(fontSize: 15 , color: Colors.white),
                           "The email address is already in use by another account",
                          
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


           if(state is AuthInitial){
            Center(
              child: CircularProgressIndicator(color: Colors.black,),
            );
           }

           
        },
        builder: (context, state) {

          

          return Stack(
            children: [
              Positioned(
                top: 50,
                right: 300,
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: GoogleFonts.copse(fontSize: 55),
                    ),
                    Form(
                      key: formkey,
                      child: SizedBox(
                        width: 400,
                        height: 500,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormWidget(
                              texteditingcontroller: usernamecontroller, 
                              hinttext: 'UserName',
                              validator: (value){
                                if(value==null || value.isEmpty || value.length<4){
                                  return "fields should not be empty or must be 3 characters";
                                }
                              },
                              ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormWidget(
                              texteditingcontroller: emailcontroller,
                              hinttext: "Email Id",
                              validator: (value){
                                final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                 if(!regex.hasMatch(value!)){
                                  return "Enter a valid email";
                                 }
                              },
                              ),
                            const SizedBox(
                              height: 30,
                            ),
                             TextFormWidget(
                              texteditingcontroller: passwordcontroller,
                              hinttext: "Password",
                              validator: (value){
                                 final regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                 if(!regExp.hasMatch(value!)){
                                  return "Password must be at least 8 characters long, include "
                                  "an uppercase letter, a lowercase letter, a number, and a special character";
                                 }
                              },
                             ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(formkey.currentState!.validate()){
                                    BlocProvider.of<AuthBloc>(context).add(
                                    SignInEvent(
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
                                    'Sign UP',
                                    style: GoogleFonts.breeSerif(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have account ?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
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
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

