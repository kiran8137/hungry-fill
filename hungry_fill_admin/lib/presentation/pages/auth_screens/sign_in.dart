import 'package:flutter/material.dart';
 
 
 
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/presentation/pages/auth_screens/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/auth_screens/widgets/textform_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/main_screen.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/auth_provider.dart';
import 'package:provider/provider.dart';
 

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
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(
            width: 500,
            height: 500,
           
            ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;
        double formWidth = screenWidth < 600 ? screenWidth * 0.85 : 400;
         return Stack(
              children: [
                Positioned(
                  top: 50,
                  right: (screenWidth-formWidth)/2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Log In",
                          style: GoogleFonts.copse(fontSize: 55),
                        ),
                        logInTextField(formWidth, context: context, emailcontroller: emailcontroller, passwordcontroller: passwordcontroller, fomrkey: _fomrkey, )
                      ],
                    ),
                  ),
                ),
              ],
            );
        }
      )
    );
        }

   
      
    
  }
 
