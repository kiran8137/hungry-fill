import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
     

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:const Color.fromARGB(30, 30, 46, 1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {

            if(state is UserAlreadyRegistered){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 38, 0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                        style: GoogleFonts.aBeeZee(fontSize: 15.sp),
                        "Already registered"),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
            }


            if (state is SigInSuccessState) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainPage()), (Route<dynamic> predicate)=>false);
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(otpdata: OTPModel(verificationId: state.))))
            }
          },
          builder: (context, state) {
            return Column(
               
              children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 30.sp,
          
                    ),
                    
                   CustomText(
                    text: 'Please sign up to get started',
                    fontSize: 16.sp,
                    ),
                  SizedBox(
                    height: 40.h,
                  ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                    ),
                    // height: 470.h,
                    // width: 396.w,
                    child: Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                              text: 'User Name',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                              CustomTextFormWidget(
                                keyboardtype:TextInputType.name,
                                controller: usernamecontroller,
                                hinttext: "User Name",
                                validator: (value){
                                  if(value!.isEmpty || value.length<4){
                                    return "fields should not be empty or must be 3 characters";
                                  }
                                }
                                 
                              ),
                              SizedBox(height: 20.h,),
                                 CustomText(
                              text: 'Mobile No',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                              CustomTextFormWidget(
                                keyboardtype: TextInputType.phone,
                                controller: mobilenumbercontroller,
                                hinttext: 'Mobile N0',
                                validator: (value){
                                   final regex = RegExp(r'^[6-9]\d{9}$');
                                   if(!regex.hasMatch(value!)){
                                    return "Enter a valid phone number";
                                   }
                          
                                },
                              ),
                              SizedBox(height: 20.h,),
                              CustomText(
                              text: 'Email',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                                
                              CustomTextFormWidget(
                                keyboardtype:TextInputType.name,
                                controller: emailcontroller,
                                hinttext: 'Email Id',
                               
                                validator: (value){
                                   final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                   if(!regex.hasMatch(value!)){
                                    return "Enter a valid email";
                                   }
                                },
                              ),
                              SizedBox(height: 20.h,),
                                 CustomText(
                              text: 'Mobile No',
                              color: Color.fromRGBO(50, 52, 62, 1),
                              fontSize: 15.sp,
                              ),
                               SizedBox(
                              height: 5.h,
                            ),
                              CustomTextFormWidget(
                                 controller: passwordcontroller,
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
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // if (usernamecontroller.text.isEmpty ||
                                  //     mobilenumbercontroller.text.isEmpty ||
                                  //     emailcontroller.text.isEmpty) {
                                  //   return;
                                  // } 
                                  if(formkey.currentState!.validate()){
                                     BlocProvider.of<AuthBloc>(context).add(
                                        SignInEvent(
                                           emailid: emailcontroller.text,
                                           password: passwordcontroller.text,
                                           username: usernamecontroller.text,
                                           phonenumber: mobilenumbercontroller.text
                                                ),
                                                );
                                  }
                                  // else {
                                   
                          
                                  //   // Navigator.push(
                                  //   //     context,
                                  //   //     MaterialPageRoute(
                                  //   //         builder: (context) =>
                                  //   //             const OtpScreen()));
                                  // }
                                },
                                child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                height: 62.h,
                                width:  double.infinity,
                                child: Center(
                                  child: CustomText(
                                    text: 'Sign Up',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              ),
                          
                              // const SizedBox(height: 10,),
                              //  const Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //    children: [
                              //       Text("Or SignUp with" , style: TextStyle(color: Color.fromARGB(255, 118, 118, 118)),)
                              //    ],
                              //  ),
                          
                              const SizedBox(height: 10,),
                               
                              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                        text: "Already have an account ?",
                        fontSize: 16.sp,
                        color: Color.fromRGBO(100, 105, 130, 1),
                        ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                  },
                  child: CustomText(
                                    text: 'Log In',
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
                      ),
                    ),
                  ),
                ),

                 
              ],
            );
          },
        ),
      )),
    );
  }
}
