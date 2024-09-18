import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/presentation/pages/auth_screens/widgets/textform_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/main_screen.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/auth_provider.dart';
import 'package:provider/provider.dart';

SizedBox logInTextField(double formwidth,{required BuildContext context ,required TextEditingController emailcontroller , required TextEditingController passwordcontroller ,required GlobalKey<FormState> fomrkey,  } ) {
    return SizedBox(
                    width: formwidth,
                    height: 500,
                    //color: Colors.red,
                    child: Form(
                      key: fomrkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormWidget(
                            texteditingcontroller: emailcontroller,
                            hinttext : "Email Id",
                            validator: (value) {
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
                            hinttext : "Password",
                            validator: (value) {
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
                            onTap: () async{
                              if(fomrkey.currentState!.validate()){
                                var result = await Provider.of<AuthProvider>(context , listen: false).logIn(emailid: emailcontroller.text, password: passwordcontroller.text);

                                if(result){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainScreen()), (Route<dynamic> predicate)=>false);
                                }
                              }
                               
                            
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primarycolor
                                  ),
                              height: 55,
                              //width: 350,
                              child: Center(
                                child: Text(
                                  'Log In',
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
                           
                        ],
                      ),
                    ),
                  );
  }