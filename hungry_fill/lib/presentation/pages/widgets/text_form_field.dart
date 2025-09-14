// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_bloc.dart';

class CustomTextFormWidget extends StatelessWidget {
      CustomTextFormWidget({
    super.key,
    required this.controller, required this.hinttext,   this.state, this.keyboardtype, this.validator, this.isObscureText,
    this.suffixIconEnabled, this.suffixIconOnTap, this.readOnly, this.onChanged, this.onTap
  });

  final TextEditingController controller;
  final String hinttext;
 final  AuthState? state;
 final TextInputType? keyboardtype;
 final String? Function(String?)? validator;
 final Function(String)? onChanged;
 final Function()? onTap;
 Function()? suffixIconOnTap;
 bool? isObscureText;
 bool? suffixIconEnabled;
 bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
       // autofocus: true,
        onTap: onTap,
        readOnly: readOnly ?? false,
        obscureText: isObscureText ?? false,
        focusNode: FocusNode(),
        validator: validator,
       autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardtype,
       controller:controller,
       onChanged: onChanged,
       decoration:   InputDecoration(
        border: InputBorder.none,
        suffixIcon: (suffixIconEnabled ?? false) ? IconButton(onPressed: suffixIconOnTap ??  (){}, icon :  Icon((isObscureText ?? false) ? Icons.visibility_off : Icons.visibility), color: Color.fromRGBO(180, 185, 202, 1),) : null,
        // focusedBorder:  OutlineInputBorder(
        //    //borderSide: const BorderSide(color: AppColors.primaryColor),
        //    borderRadius: BorderRadius.circular(8)
        //  ),
         
         enabledBorder:   OutlineInputBorder(
           borderSide: const BorderSide(color: const Color.fromRGBO(240, 245, 250, 1)),
           borderRadius: BorderRadius.circular(8)
         ),
         
         fillColor: const Color.fromRGBO(240, 245, 250, 1),
         filled: true,
         hintText: hinttext,
         hintStyle:  GoogleFonts.sen(fontSize: 14.sp, color: const Color.fromRGBO(160, 165, 186, 1)),
        
         
       ),
      ),
    );
  }
}
