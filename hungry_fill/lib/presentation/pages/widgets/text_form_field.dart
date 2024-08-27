// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';

class TextFormWidget extends StatelessWidget {
    const TextFormWidget({
    super.key,
    required this.controller, required this.hinttext,   this.state, this.keyboardtype, this.validator
  });

  final TextEditingController controller;
  final String hinttext;
 final  AuthState? state;
 final TextInputType? keyboardtype;
 final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      validator: validator,
     autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardtype,
     controller:controller,
     decoration:   InputDecoration(

      focusedBorder:  OutlineInputBorder(
         borderSide: const BorderSide(color: primarycolor),
         borderRadius: BorderRadius.circular(8)
       ),
       
       enabledBorder:   OutlineInputBorder(
         borderSide: const BorderSide(color: Color.fromARGB(255, 191, 191, 191),),
         borderRadius: BorderRadius.circular(8)
       ),
       fillColor: Colors.white,
       filled: true,
       hintText: hinttext,
       hintStyle: const TextStyle(fontWeight: FontWeight.w400 ,color: Color.fromARGB(255, 203, 203, 203))
      
       
     ),
    );
  }
}
