// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_in_bloc.dart';

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
      validator: validator,
     autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardtype,
     controller:controller,
     decoration:   InputDecoration(
       
       enabledBorder:   OutlineInputBorder(
         borderSide: const BorderSide(color: Colors.white,),
         borderRadius: BorderRadius.circular(8)
       ),
       fillColor: Colors.white,
       filled: true,
       hintText: hinttext,
      
       
     ),
    );
  }
}
