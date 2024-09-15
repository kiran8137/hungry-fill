import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hungry_fill/data/repository/auth_repo_impl/authentication_repo.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/address/addresses_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/about_page/about_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/components/components.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/privacy_policy_page/privacy_policy_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/user_detail_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/profile_menu_widget.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key, this.userinfo});

  final UserModel? userinfo;

  static onLogOut() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(userloggedkey, false);
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDetailPage(
                                username: userinfo?.username,
                                usermobileno: userinfo?.usermobilenumber,
                                useremailid: userinfo?.useremail,
                              ))).then((_) {
                    BlocProvider.of<UsersBloc>(context).add(UserGetEvent());
                  });
                },
                child: userProfileCard(userinfo: userinfo),
              ),
            ),
              SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ordersSection(),
                    ),
                    Text(
                      "Orders",
                      style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500),
                    )
                  ],
                ),

                //SizedBox(width: 170,),
                Column(
                  children: [
                    totalAmountSection(),
                    Text(
                      "1000",
                      style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
              SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {},
              child: ProfileMenuWidget(
                leadingicon: 'assets/locationIcon.png',
                title: 'Address',
                trailing: "assets/next.png",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressPage()));
                },
              ),
            ),
            ProfileMenuWidget(
              leadingicon: 'assets/information-button.png',
              title: 'About',
              trailing: "assets/next.png",
              ontap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const AboutPage()));
              },
            ),
            ProfileMenuWidget(
              leadingicon: 'assets/privacy.png',
              title: 'Privacy and Policy',
              trailing: "assets/next.png",
              ontap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const PrivacyPolicyPage()));
              },
            ),
            logOutOption(context)
          ],
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
                              onLogOut();
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
              width: 25.w,
              height: 25.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/power-off.png"))),
            ),
            title: Text(
              "Log Out",
              style: GoogleFonts.abhayaLibre(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            trailing:   SizedBox(
              width: 25.w,
              height: 25.h,
            ),
          );
  }
}
