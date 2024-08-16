import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
      this.texteditingcontroller, 
      this.hinttext, 
      this.validator,
      this.labeltext
  });

  final TextEditingController? texteditingcontroller;
  final String? hinttext;
  final String? Function(String?)? validator;
  final String? labeltext;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator:  validator,
      autovalidateMode:
          AutovalidateMode.onUserInteraction,
      controller: texteditingcontroller,
      decoration: InputDecoration(
         
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8)),
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext
      ),
    );
  }
}
