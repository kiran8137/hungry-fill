import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';

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
          backgroundColor: Colors.white,
          title: Text(
            "Detail Page",
            style: GoogleFonts.abhayaLibre(),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    isedit = !isedit;
                  });
                },
                child: const Icon(Icons.edit)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/userprofile.jpg")),
                            color: Colors.red,
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        readOnly: isedit,
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        readOnly: isedit,
                        controller: mobilenumbercontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        readOnly: isedit,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 160,
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
                                      color: primarycolor),
                                  height: 50,
                                  width: 350,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(' Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
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
