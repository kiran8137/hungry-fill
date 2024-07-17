import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/otp_model/otp_model.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_inauth_event.dart';
import 'package:hungry_fill/presentation/pages/main_pages/main_page.dart';
 

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.otpdata, required this.username, required this.useremail});

  final OTPModel otpdata;
  final String? username;
  final String? useremail;

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpcontroller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {

              


               if(state is OtpVerified){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainPage()), (Route<dynamic> predicate)=>false);
               }
            },
            builder: (context, state) {

                  if(state is AuthInitial){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }

              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'OTP Verification',
                    style: GoogleFonts.copse(fontSize: 30, color: primarycolor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'code just sent to your mobile number',
                    style: GoogleFonts.aBeeZee(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: const Color.fromARGB(57, 158, 158, 158),
                    ),
                    height: 200,
                    width: 396,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: otpcontroller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(8)),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                  VerifyOtpEvent(
                                    username: username,
                                    useremail: useremail,
                                      otpCode: otpcontroller.text,
                                      verificationid: otpdata.verificationId!));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primarycolor),
                              height: 55,
                              width: 210,
                              child: Center(
                                child: Text(
                                  'Verify OTP',
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
                  const SizedBox(height: 20),
                  Text(
                    "Didn't get the OTP?",
                    style: GoogleFonts.aBeeZee(color: Colors.grey),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
