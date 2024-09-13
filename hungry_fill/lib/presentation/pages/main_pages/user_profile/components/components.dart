import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/user_profile.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';

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


 AppBar appBarAboutPage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new)),
      title: Text('About',
      style: GoogleFonts.abhayaLibre()
      ),
      centerTitle: true,
    );
  }

  Padding aboutPageContent() {
    return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                aboutus,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            );
  }

ListTile logOutOption(BuildContext context) {
    return ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure want to log out...!",
                          style: GoogleFonts.abhayaLibre()),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              const UserProfileScreen().logOutOption(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()),
                                  (Route<dynamic> predicate) => false);
                            },
                            child: const Text("yes"))
                      ],
                    );
                  });
              
            },
            minLeadingWidth: 0.5,
            leading: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/power-off.png"))),
            ),
            title: Text(
              "Log Out",
              style: GoogleFonts.abhayaLibre(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            trailing: const SizedBox(
              width: 25,
              height: 25,
            ),
          );
  }