import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage(
      {super.key, this.username, this.usermobileno, this.useremailid});

  final String? username;
  final String? usermobileno;
  final String? useremailid;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late final TextEditingController usernamecontroller =
      TextEditingController(text: widget.username);

  late final TextEditingController mobilenumbercontroller =
      TextEditingController(text: widget.usermobileno);

  late final TextEditingController emailcontroller =
      TextEditingController(text: widget.useremailid);

  bool isedit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title: CustomText(
        text:   'Detail Page',
          
                fontSize: 17.sp,
                color: Color.fromRGBO(24, 528, 46, 1),
        ),
         actions: [
               GestureDetector(
                onTap: () {
                  setState(() {
                    isedit = !isedit;
                  });
                },
                child:  CustomText(
        text:   'Edit',
          
                fontSize: 14.sp,
                color: AppColors.primaryColor,
        ),),
              SizedBox(
              width: 10.w,
            )
         ],
      ),
        //  AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     "Detail Page",
        //     style: GoogleFonts.abhayaLibre(),
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             isedit = !isedit;
        //           });
        //         },
        //         child: const Icon(Icons.edit)),
        //       SizedBox(
        //       width: 10.w,
        //     )
        //   ],
        // ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/person.png")),
                            //color: Colors.red,
                            shape: BoxShape.circle),
                      ),
                        SizedBox(
                        height: 30.h,
                      ),
                       
                      CustomTextFormWidget(
                        controller: usernamecontroller,
                         hinttext: '',
                         readOnly: isedit,
                         ),
                        SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormWidget(
                        readOnly: isedit,
                        controller: mobilenumbercontroller,
                        hinttext: '',
                      ),
                      SizedBox(
                        height: 30.h,),
                      CustomTextFormWidget(
                        readOnly: isedit,
                        controller: emailcontroller,
                         hinttext: '',
                      ),
                        SizedBox(
                        height: 158.h,
                      ),
                      !isedit
                          ? BlocListener<UsersBloc, UsersState>(
                              listener: (context, state) {
                                 if(state is UserUpdateSuccessState){
                                  Navigator.pop(context);
                                 }
                              },
                              child: GestureDetector(
                                onTap: () {
                                  UserModel user = UserModel(
                                      username: usernamecontroller.text,
                                      usermobilenumber:
                                          mobilenumbercontroller.text,
                                      useremail: emailcontroller.text);
                                  BlocProvider.of<UsersBloc>(context)
                                      .add(UserUpdateEvent(user));
                                
                                },
                                
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primaryColor),
                                  height: 45.h,
                                  width: 350.w,
                                  child:   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(' Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp)),
                                    ],
                                  ),
                                ).animate(
                                  effects: [
                                  const SlideEffect(),
                                  const FadeEffect(),
                                ]),
                              ),
                            )
                          : const SizedBox()
                    ])))));
  }
}
