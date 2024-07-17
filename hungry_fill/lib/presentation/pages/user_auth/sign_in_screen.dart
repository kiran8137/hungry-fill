import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_inauth_event.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';
import 'package:hungry_fill/presentation/pages/user_auth/widgets/text_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

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

            if(state is UserAlreadyRegistered){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 38, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "Already registered"),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
            }


            if (state is AuthOtpSent) {
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
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(otpdata: OTPModel(verificationId: state.))))
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
                  'Sign Up',
                  style: GoogleFonts.copse(fontSize: 70, color: primarycolor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: const Color.fromARGB(57, 158, 158, 158),
                  ),
                  height: 470,
                  width: 396,
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormWidget(
                              keyboardtype:TextInputType.name,
                              controller: usernamecontroller,
                              hinttext: "User Name",
                              validator: (value){
                                if(value!.isEmpty || value.length<4){
                                  return "fields should not be empty or must be 3 characters";
                                }
                              }
                               
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormWidget(
                              keyboardtype: TextInputType.phone,
                              controller: mobilenumbercontroller,
                              hinttext: 'Mobile N0',
                              validator: (value){
                                 final regex = RegExp(r'^\+91[6-9]\d{9}$');
                                 if(!regex.hasMatch(value!)){
                                  return "Enter a valid phone number";
                                 }
                        
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormWidget(
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
                                      SendOtpEvent(
                                        username: usernamecontroller.text,
                                        useremail: emailcontroller.text,
                                          phonenumber:
                                              mobilenumbercontroller.text,
                                          context: context
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
                        
                            const SizedBox(height: 10,),
                             const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                  Text("Or SignUp with" , style: TextStyle(color: Color.fromARGB(255, 118, 118, 118)),)
                               ],
                             ),
                        
                            const SizedBox(height: 10,),
                             GestureDetector(
                              onTap: (){},
                               child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  height: 45,
                                  width: 381,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Facebook',
                                        style: TextStyle(color: Color.fromARGB(255, 118, 118, 118), fontSize: 17)
                                      ),
                                       const SizedBox(width: 5,),
                                        Image.asset("assets/facebook.png" , height: 25,)
                                    ],
                                  ),
                                ),
                             ),
                        
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account ?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 118, 118, 118))),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                  },
                  child: const Text("Log In",
                      style:   TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        
                      )
                      ),
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
