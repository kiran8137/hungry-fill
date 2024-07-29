import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/header_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/restaurant_user/restaurant_user_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key,
      this.index,
      this.restaurantname,
      this.restaurantmobileNo,
      this.restaurantstate,
      this.restaurantdistrict,
      this.restaurantplace});

  final int? index;

//  final RestaurantModel? restaurantmodel;
  final String? restaurantname;

  final String? restaurantmobileNo;
  final String? restaurantstate;
  final String? restaurantdistrict;
  final String? restaurantplace;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController restaurantnamecontroller = TextEditingController();

  late TextEditingController restaurantmobilenocontroller =
      TextEditingController();

  late TextEditingController restaurantstatecontroller =
      TextEditingController();

  late TextEditingController restaurantdistrictcontroller =
      TextEditingController();

  late TextEditingController restaurantplacecontroller =
      TextEditingController();

  @override
  void initState() {
    restaurantnamecontroller =
        TextEditingController(text: widget.restaurantname);

    restaurantmobilenocontroller =
        TextEditingController(text: widget.restaurantmobileNo);

    restaurantstatecontroller =
        TextEditingController(text: widget.restaurantstate);

    restaurantdistrictcontroller =
        TextEditingController(text: widget.restaurantdistrict);

    restaurantplacecontroller =
        TextEditingController(text: widget.restaurantplace);

       //BlocProvider.of<RestaurantUserBloc>(context).add(GetRestaurantDetailEvent());
    super.initState();
     
  }

  bool isedit = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          HeaderWidget(),
        const SizedBox(
          height: 45,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              "Profile",
              style: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.bold, fontSize: 38),
            ),
    
            const SizedBox(
              width: 550,
            ),
    
            TextButton.icon(
                onPressed: () {
                  setState(() {
                    isedit = !isedit;
                  });
                },
                label: const Icon(
                  Icons.edit,
                  color: primarycolor,
                ))
    
            // SizedBox(width: 1050,),
          ],
        ),
        SizedBox(
          height: 500,
          width: 800,
          //color: Colors.red,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Restaurant"),
                      TextFormField(
                        readOnly: isedit,
                        // validator:  validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: restaurantnamecontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("mobile No"),
                      TextFormField(
                        readOnly: isedit,
                        // validator:  validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: restaurantmobilenocontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Text(
              "Address",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("State"),
                      TextFormField(
                        readOnly: isedit,
                        // validator:  validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: restaurantstatecontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("District"),
                      TextFormField(
                        readOnly: isedit,
                        // validator:  validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: restaurantdistrictcontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("place"),
                      TextFormField(
                        readOnly: isedit,
                        // validator:  validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: restaurantplacecontroller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                  width: 300,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            !isedit
                ? BlocConsumer<RestaurantUserBloc, RestaurantUserState>(
                    listener: (context, state) {
                      if(state is RestaurantUpdatedSucess){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                        style: GoogleFonts.aBeeZee(fontSize: 15 , color: Colors.white),
                         "Restaurant Detail updated successfully",
                        
                        ),
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
           );
           Center(
            child: CircularProgressIndicator(),
           );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: (){
                         RestaurantModel restaurant =  RestaurantModel(
                            restaurantname: restaurantnamecontroller.text,
                            restaurantmobileNo: restaurantmobilenocontroller.text,
                            restaurantstate: restaurantstatecontroller.text,
                            restaurantdistrict: restaurantdistrictcontroller.text,
                            restaurantplace: restaurantplacecontroller.text
    
                          );
    
                          BlocProvider.of<RestaurantUserBloc>(context).add(UpdateRestaurantEvent(updatedrestaurantdetail: restaurant));
                                   BlocProvider.of<RestaurantUserBloc>(context).add(GetRestaurantDetailEvent());
                        },
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                            "Save",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17),
                          )),
                        ).animate(effects: [SlideEffect(), FadeEffect()]),
                      );
                    },
                  )
                : SizedBox()
          ]),
        )
      ],
    );
  }
}
