import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/assets.dart';

import 'package:hungry_fill/data/repository/auth_repo_impl/authentication_repo.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/address/addresses_page.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_detail_screen.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_restauants.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/about_page/about_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/components/components.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/privacy_policy_page/privacy_policy_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/user_detail_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/profile_menu_widget.dart';
import 'package:hungry_fill/presentation/pages/user_auth/log_in_screen.dart';
import 'package:hungry_fill/presentation/pages/whishlist/whishlist_page.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key, });

  // final UserModel? userinfo;

  static onLogOut() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(userloggedkey, false);
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
         BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
      },
      child: Scaffold(
         appBar: AppBar(
          
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          title: CustomText(
                  text: 'Profile',
                  fontSize: 17.sp,
                  color: Color.fromRGBO(24, 528, 46, 1),
                ),
           
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<UsersBloc, UsersState>(
          buildWhen: (previous, current) => current is UserLoadedState || current is UserLoadedError,
          builder: (context, state) {
            if(state is UserLoadedError){
             return Center(child: Text('something went wrong'),);//TODO ADD ERROR WIDGET
            }
            if(state is! UserLoadedState){
             return Center(child: CircularProgressIndicator(),);
            }
            final  userinfo = state.userdetails;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    GestureDetector(
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 250, 1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                           GestureDetector(
                      onTap: () {},
                      child: ProfileMenuWidget(
                        leadingicon: Assets().userIcon,
                        leadingIconColor: AppColors.primaryColor,
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
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         GestureDetector(
                    //           onTap: () {},
                    //           child: ordersSection(),
                    //         ),
                    //         Text(
                    //           "Orders",
                    //           style:
                    //               GoogleFonts.aBeeZee(fontWeight: FontWeight.w500),
                    //         )
                    //       ],
                    //     ),
                
                    //     //SizedBox(width: 170,),
                    //     Column(
                    //       children: [
                    //         totalAmountSection(),
                    //         Text(
                    //           "1000",
                    //           style:
                    //               GoogleFonts.aBeeZee(fontWeight: FontWeight.w500),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                   Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 250, 1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                           GestureDetector(
                      onTap: () {},
                      child: ProfileMenuWidget(
                        leadingicon: Assets().cartIcon,
                        leadingIconColor: Color.fromRGBO(54, 155, 255, 1),
                        title: 'Cart',
                        trailing: "assets/next.png",
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>   Cart()));
                        },
                      ),
                    ),
                     ProfileMenuWidget(
                       leadingicon: Assets().favIcon,
                       leadingIconColor: Color.fromRGBO(54, 155, 255, 1),
                       title: 'WishList',
                       trailing: "assets/next.png",
                       ontap: () {
                        BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsInWishList());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WishListPage()));
                       },
                     ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 250, 1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          ProfileMenuWidget(
                            leadingicon:  Assets().aboutUsIcon,
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
                      leadingicon: Assets().privacyPolicyIcon,
                      title: 'Privacy and Policy',
                      trailing: "assets/next.png",
                      ontap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const PrivacyPolicyPage()));
                      },
                    ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 250, 1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ProfileMenuWidget(
                        leadingicon: Assets().logOut,
                        leadingIconColor: AppColors.primaryColor,
                        title: 'Log out',
                        trailing: "assets/next.png",
                        ontap: () {
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
                      ),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text("Are you sure want to log out...!",
                    //                 style: GoogleFonts.abhayaLibre()),
                    //             actions: [
                    //               TextButton(
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                   child: const Text("No")),
                    //               TextButton(
                    //                   onPressed: () {
                    //                     onLogOut();
                    //                     Navigator.pushAndRemoveUntil(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder: (context) =>
                    //                                 const LogInScreen()),
                    //                         (Route<dynamic> predicate) => false);
                    //                   },
                    //                   child: const Text("yes"))
                    //             ],
                    //           );
                    //         });
                    //   },
                    //   minLeadingWidth: 0.5,
                    //   leading: Container(
                    //     width: 25.w,
                    //     height: 25.h,
                    //     decoration: const BoxDecoration(
                    //         image: DecorationImage(
                    //             image: AssetImage("assets/power-off.png"))),
                    //   ),
                    //   title: Text(
                    //     "Log Out",
                    //     style: GoogleFonts.abhayaLibre(
                    //         color: Colors.black,
                    //         fontSize: 22.sp,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    //   trailing: SizedBox(
                    //     width: 25.w,
                    //     height: 25.h,
                    //   ),
                    // )
                    //logOutOption(context)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
