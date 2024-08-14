import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/categories.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
  
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/main_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';

import '../../common_widgets/textform_widget.dart';

class ResDetailAddScreen extends StatelessWidget {
  ResDetailAddScreen({super.key,  this.username});
  

  final String? username;

  final TextEditingController restaurantnamecontroller =
      TextEditingController();
  final TextEditingController restaurantmobilenocontroller =
      TextEditingController();
  final TextEditingController restaurantstatecontroller =
      TextEditingController();
  final TextEditingController restaurantdistrictcontroller =
      TextEditingController();
  final TextEditingController restaurantplacecontroller =
      TextEditingController();

       final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: SizedBox(
              width: 500,
              height: 500,
              child: Image.asset(
                "assets/Hung.png",
                height: 500,
                width: 500,
              )),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ResDetailSuccessState) {
 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainScreen()), (Route<dynamic> predicate)=>false);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 200,
                  // right: 500,
                  child: Column(
                    children: [
                      Text(
                        "Establish Your Restaurant",
                        style: GoogleFonts.copse(fontSize: 40),
                      ),
                      Form(
                        key: formkey,
                        child: SizedBox(
                          width: 300,
                          height: 600,
                          //color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormWidget(
                                texteditingcontroller: restaurantnamecontroller,
                                hinttext: "Restaurant Name",
                                validator: (value){
                                  if(value==null || value.isEmpty || value.length<3){
                                    return "Field is empty or Must have more than 2 characters";
                                  }
                                },
                                
                                
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                        
                               TextFormWidget(
                                texteditingcontroller: restaurantmobilenocontroller,
                                hinttext: "Mobile No",
                                validator: (value){
                                  final regex = RegExp(r'^[6-9]\d{9}$');
                                 if(!regex.hasMatch(value!)){
                                  return "Enter a valid phone number";
                                 }
                                },
                               ),
                        
                              const SizedBox(
                                height: 15,
                              ),
                        
                              const Text(
                                "Address",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                        
                              TextFormWidget(
                                texteditingcontroller: restaurantstatecontroller,
                                hinttext: "State",
                                validator: (value){
                                  if(value == null || value.isEmpty || value.length<3){
                                    return "Enter a valid state";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormWidget(
                                texteditingcontroller: restaurantdistrictcontroller,
                                hinttext: "District",
                                validator: (value){
                                  if(value == null || value.isEmpty || value.length<3){
                                    return "Enter a valid District";
                                  }
                                },
                              ),
                        
                              const SizedBox(
                                height: 10,
                              ),
                        
                              TextFormWidget(
                                texteditingcontroller: restaurantplacecontroller,
                                hinttext: "place",
                                validator: (value){
                                  if(value == null || value.isEmpty || value.length<3){
                                    return "Enter a valid place";
                                  }
                                },
                              ),
                        
                              const SizedBox(
                                height: 10,
                              ),
                        
                              const SizedBox(
                                height: 20,
                              ),
                        
                              GestureDetector(
                                onTap: () {
                                  if(formkey.currentState!.validate()){
                                     var restaurant = RestaurantModel(
                                      userid:
                                          FirebaseAuth.instance.currentUser?.uid,
                                      username: username,
                                      restaurantname:
                                          restaurantnamecontroller.text,
                                      restaurantemail: FirebaseAuth
                                          .instance.currentUser?.email,
                                      restaurantmobileNo:
                                          restaurantmobilenocontroller.text,
                                      restaurantstate:
                                          restaurantstatecontroller.text,
                                      restaurantdistrict:
                                          restaurantdistrictcontroller.text,
                                      restaurantplace:
                                          restaurantplacecontroller.text);
                        
                                  BlocProvider.of<AuthBloc>(context).add(
                                      ResDetailAddEvent(
                                          restaurantmodel: restaurant));
                                          
                                   BlocProvider.of<CategoryBloc>(context).add(CreateCategoryEvent(categorymodel:categories ));
                                   
                                  }
                                 
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primarycolor),
                                  height: 50,
                                  //width: 350,
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: GoogleFonts.breeSerif(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                        
                              // GestureDetector(
                              //   onTap: () {
                        
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         color: primarycolor),
                              //     height: 55,
                              //     //width: 350,
                              //     child: Center(
                              //       child: Text(
                              //         'Sign UP',
                              //         style: GoogleFonts.breeSerif(
                              //             color: Colors.white, fontSize: 30),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // const Divider(),
                              //  Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Text(
                              //       "Already have account ?",
                              //       style: TextStyle(color: Colors.grey),
                              //     ),
                              //     const SizedBox(
                              //       width: 5,
                              //     ),
                              //     GestureDetector(
                              //       onTap: (){
                              //      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                              //       },
                              //       child: const Text(
                              //         "Login",
                              //         style: TextStyle(
                              //             color: Color.fromARGB(255, 26, 115, 188)),
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
