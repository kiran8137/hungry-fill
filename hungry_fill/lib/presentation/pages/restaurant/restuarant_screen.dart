import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_page.dart';
 
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';
import 'package:hungry_fill/presentation/pages/restaurant/widgets/dish_widget.dart';

import '../../bloc/category_bloc/category_bloc.dart';

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
    BlocProvider.of<CategoryBloc>(context)
        .add(GetCategories(resuerid: widget.resuerid));
      
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.shopping_cart,color: Colors.white,),
        backgroundColor: primarycolor,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
        }),
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
                  onTap: ()  {
                   
                   //addDish();
                   // categoryhDishes();
                    //searchDishes();
                    //categorys();
                  },
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          
                          children: [
                              Positioned(
                              right: 0,
                               
                              child: 
                             // Icon(Icons.favorite,color: Colors.white,)
                              GestureDetector(
                                onTap: (){
                                   BlocProvider.of<RestaurantBloc>(context).add(AddRestaurantToWishList(restaurantid: widget.resuerid!));
                                  //addToWishList(restaurantid: widget.resuerid!);
                                },
                                child: const Icon(Icons.favorite_border,color: Colors.white,))
                              ),
                        
                            Column(
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
                          ],
                        ),

                        
                      ),
                      
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchWidget(searchcontroller: searchcontroller , resuserid: widget.resuerid,),
                 
                 BlocConsumer<CategoryBloc , CategoryState>(
                  builder:(context , state){
                    print(state.runtimeType.toString());
                    

                    if(state is GetCategoriesSuccesState){
                      
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.categories.map((category)=>
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FilterChip(
                               shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                            ),
                              backgroundColor: Colors.white,
                              
                              label: Text(category.categoryname!), 
                              selectedColor: primarycolor,
                              onSelected: (bool isseleced){
                                
                              }
                              ),
                          )
                          ).toList(),
                        
                        ),
                      );
                    }else{
                      return const Text("somethign went wrong");
                    }
                  }, listener: (BuildContext context, CategoryState state) {  }, 
                 
                  ),


                const Text('category'),

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
                        child:   Divider(
                      color: Colors.grey,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                
                        BlocConsumer<DishBloc, DishState>(
                          
                       listener: (BuildContext context, DishState state) { 
                    if(state is AddDishToCartSuccesState){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(restaurantid: widget.resuerid, restaurantname: widget.restaurantname,)));
                    }
                   },
                      builder: (context, state) {
                        print('in list dish ${state.runtimeType.toString()}');
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

                       
                        

                        if (state is DishSuccesEvent 
                        || state is SearchDishSuccessState 
                        ) {
                          final dishes = state is DishSuccesEvent ? state.dish 
                          : (state as SearchDishSuccessState).dishes ;
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                 
                                return Dishwidget(
                                  restaurantid: widget.resuerid!,
                                  dish: dishes[index],
                                  restaurantname: widget.restaurantname!,
                                  ctx: context,
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
