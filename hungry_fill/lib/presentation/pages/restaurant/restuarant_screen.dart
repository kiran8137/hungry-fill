import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/dish_model/dish_model.dart';
import 'package:hungry_fill/data/repository/dish_repo_imp/dish_repo_impl.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';
import 'package:hungry_fill/presentation/pages/restaurant/widgets/dish_widget.dart';

class RestuarantScreen extends StatefulWidget {
  const RestuarantScreen(
      {super.key,
      this.resuerid,
      this.restaurantname,
      this.restaurantdistrict,
      this.restaurantplace});

  final String? resuerid;
  final String? restaurantname;
  final String? restaurantdistrict;
  final String? restaurantplace;

  @override
  State<RestuarantScreen> createState() => _RestuarantScreenState();
}

class _RestuarantScreenState extends State<RestuarantScreen> {
  final TextEditingController searchcontroller = TextEditingController();
 late DishModel dish;

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
                GestureDetector(
                  onTap: (){
                    categoryhDishes();
                    //searchDishes();
                  },
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.restaurantname ?? '',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.restaurantplace ?? '',
                                  style: GoogleFonts.jost(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                  
                                //Text(".",style: TextStyle(color: Colors.white , fontSize: 20),),
                                const Icon(
                                  Icons.fiber_manual_record,
                                  size: 10,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.restaurantdistrict ?? '',
                                  style: GoogleFonts.jost(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchWidget(searchcontroller: searchcontroller , resuserid: widget.resuerid,),
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
                const SizedBox(
                  height: 20,
                ),
                
                        BlocConsumer<DishBloc, DishState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is DishInitial) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (state is DishErrorState) {
                          return Center(
                            child: Text(
                                state.errormessage ?? "something went wrong"),
                          );
                        }

                        

                        if (state is DishSuccesEvent || state is SearchDishSuccessState) {
                          final dishes = state is DishSuccesEvent ? state.dish : (state as SearchDishSuccessState).dishes ;
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                 
                                return Dishwidget(
                                  
                                  dish: dishes[index]
                                  );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: dishes.length
                              );
                        } else {
                          return const Center(child: Text("no dish available"));
                        }
                      },
                    )
                    
                    
                
                
              ],
            ),
          ),
        )));
  }
}
