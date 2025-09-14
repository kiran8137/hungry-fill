import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key, required this.leadingicon, required this.title, this.trailing, required this.ontap, this.leadingIconColor,
  });
 final String leadingicon;
 final Color? leadingIconColor;
 final String title;
 final String? trailing;
 final VoidCallback ontap;
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 0.5,
      leading: Container(
       
        width: 40.w,
        height: 40.h,
        decoration:   BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          // image: DecorationImage(
             
          //   image: AssetImage(leadingicon,) 
          // )
        ),
        child: Image.asset(leadingicon, color: leadingIconColor,),
        ),
        title: CustomText(
         text:  title,
         fontSize: 16.sp,
         color: Color.fromRGBO(50, 52, 62, 1),
        ),
        trailing: Container(
        width: 15.w,
        height: 15.h,
        decoration:   trailing !=null ?
        BoxDecoration(
          image: DecorationImage(
            image: AssetImage(trailing!) 
          )
        ): null
        ),
    );
  }
}