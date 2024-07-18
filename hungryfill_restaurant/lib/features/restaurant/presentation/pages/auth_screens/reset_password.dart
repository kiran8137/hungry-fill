import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  TextEditingController emailcontroller = TextEditingController();
  final _fomrkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
       
      body:   Stack(
            children: [
              Positioned(
                top: 50,
                 left: 580,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                  children: [
                    Text(
                      "Password Recovery",
                      style: GoogleFonts.copse(fontSize: 50),
                    ),

                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                        SizedBox(width: 80,),
                         Text(
                          "Enter your email",
                          style: GoogleFonts.copse(fontSize: 30),
                                             ),
                       ],
                     ),

                    SizedBox(
                      width: 400,
                      height: 500,
                      //color: Colors.red,
                      child: Form(
                        key: _fomrkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              
                              validator: (value) {
                                if(value == null){
                                  return "There is no account with this email";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                               controller: emailcontroller,
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
                            const SizedBox(
                              height: 30,
                            ),
                            
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(_fomrkey.currentState!.validate()){
                                  BlocProvider.of<AuthBloc>(context).add(ResetPasswordEvent(email: emailcontroller.text));
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
                                    'Send Email',
                                    style: GoogleFonts.breeSerif(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                            
                            
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )

    );
        }
      
    
  }
