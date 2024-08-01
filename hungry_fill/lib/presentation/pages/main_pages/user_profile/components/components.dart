import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';

//Userprofilepage card profilepage
Container userProfileCard({required UserModel? userinfo}) {
  return Container(
    height: 135,
    width: double.infinity,
    decoration: BoxDecoration(
        color: primarycolor, borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/userprofile.jpg"))),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120,
                child: Text(
                  userinfo!.username!,
                  style: GoogleFonts.abhayaLibre(
                      fontSize: 26, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              Text(
                "Edit Profile >",
                style: GoogleFonts.aBeeZee(fontSize: 12, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

//OrdersSection profile page
Container ordersSection() {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
        //shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/paper-bag.png"))),
  );
}

//total Amount Section profile page
Container totalAmountSection() {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/userprofile.jpg"))),
  );
}
