import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key, required this.leadingicon, required this.title, this.trailing, required this.ontap,
  });
 final String leadingicon;
 final String title;
 final String? trailing;
 final VoidCallback ontap;
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 0.5,
      leading: Container(
       
        width: 25.w,
        height: 25.h,
        decoration:   BoxDecoration(
           
          image: DecorationImage(
            image: AssetImage(leadingicon) 
          )
        ),
        ),
        title: Text(title,
        style: GoogleFonts.abhayaLibre(
        color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold
        ),
        ),
        trailing: Container(
        width: 25.w,
        height: 25.h,
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