import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key, required this.menuitemname,
  });

  final String menuitemname;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 180,
        decoration: BoxDecoration(
            color: primarycolor,
            borderRadius: BorderRadius.circular(17)),
        child: Center(
          child: Text(menuitemname,
          style: GoogleFonts.inriaSans(
            fontSize: 29,
            color: Colors.white
          ),
          )
        )
        );
  }
}
