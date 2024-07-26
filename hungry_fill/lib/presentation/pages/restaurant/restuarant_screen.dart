import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';

class RestuarantScreen extends StatefulWidget {
 const RestuarantScreen({super.key, this.resuerid, this.restaurantname, this.restaurantdistrict, this.restaurantplace});

  final String? resuerid;
  final String? restaurantname;
  final String? restaurantdistrict;
  final String? restaurantplace;


  @override
  State<RestuarantScreen> createState() => _RestuarantScreenState();
}

class _RestuarantScreenState extends State<RestuarantScreen> {
  final TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<DishBloc>(context)
        .add(DishGetEvent(resuserid: widget.resuerid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: GoogleFonts.abhayaLibre(),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [

                      ],)
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchWidget(searchcontroller: searchcontroller),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Dishes",
                      style: GoogleFonts.amita(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                        child: const Divider(
                      color: Colors.grey,
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<DishBloc, DishState>(
                  listener: (context, state) {
                     
                  },
                  builder: (context, state) {

                    if(state is DishInitial){
                      return Center(child: CircularProgressIndicator());
                    }

                    if(state is DishErrorState){
                      return Center(child: Text("something went wrong"),);
                    }

                    if(state is DishSuccesEvent){
                      

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final dish = state.dish[index];
                          return Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 246, 245, 245),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dish.dishname!,
                                          style: GoogleFonts.abhayaLibre(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "₹${dish.dishprice!}",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 15,
                                              fontWeight:FontWeight.bold),
                                        ),

                                        Text("${dish.dishserve} serve" ,style: TextStyle(
                                          fontSize: 15,
                                          color: const Color.fromARGB(255, 114, 114, 114)
                                        ),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Container(
                                          height: 45,
                                          width: 155,
                                          decoration: BoxDecoration(
                                            color: primarycolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "ADD",
                                              style: GoogleFonts.abrilFatface(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: state.dish.length);
                    }else{
                      return Center(child: Text("no dish available"));
                    }
                    
                  },
                )
              ],
            ),
          ),
        )));
  }
}
