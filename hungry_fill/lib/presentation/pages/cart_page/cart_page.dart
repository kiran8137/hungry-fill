 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/data/repository/cart_repo_imp/cart_repo_impl.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, this.restaurantid, this.restaurantname});

  final String? restaurantid;
  final String? restaurantname;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  late List<String> dishids = [];
  
  @override
  void initState() {
    
     BlocProvider.of<DishBloc>(context).add(GetCartEvent(restaurantid: widget.restaurantid));
        
        
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                 BlocProvider.of<DishBloc>(context).add(GetRestaurantsInCart());
                
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: const Color.fromARGB(255, 188, 188, 188),
              height: 1,
            ),
          ),
          title: Column(
            children: [
              Text(
                'Your Cart',
                style: GoogleFonts.abhayaLibre(),
              ),
              Text(
                widget.restaurantname!,
                style:
                    GoogleFonts.acme(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        floatingActionButton: GestureDetector(
          onTap: (){
            //carttotal(dishids: dishids);
             
          },
          child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                  color: primarycolor, borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  "Procced to Check out",
                  style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 20),
                ),
              ),
              ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            if(state is GetCartInitial){
              return Center(child: CircularProgressIndicator(),
              );
            }
            if(state is GetCartSuccessState){
               return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                        height: 310,
                        width: double.infinity,
                        
                          child:
                          
                          
                              
                                
                                  SingleChildScrollView(
                                  child: ListView.separated(
                                     
                                    separatorBuilder: (context, index) => const Divider(),
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.cart.length,
                                    itemBuilder: (context, index) {
                                    
                                     final cartdish = state.cart[index];
                                      return Container(
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(155, 248, 248, 248),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(10)),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 90,
                                                  child: Text(
                                                     cartdish.dishname!,
                                                    maxLines: 2,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ),

                                                Text("₹ ${cartdish.priceperquantity.toString()}",
                                                style: TextStyle(fontSize: 15,color: Colors.grey),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 50,),
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: primarycolor),
                                                  borderRadius: BorderRadius.circular(8)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  const Icon(
                                                    Icons.remove,
                                                    size: 20,
                                                    color: primarycolor,
                                                  ),
                                                  Text(
                                                    cartdish.dishquantity.toString(),
                                                    style: GoogleFonts.abhayaLibre(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: primarycolor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            // Expanded(
                                            //     child: Text(
                                            //   cartdish.priceperquantity.toString(),
                                            //   style: GoogleFonts.aBeeZee(fontSize: 15),
                                            // )
                                            // )
                                          ],
                                        ),
                                      );
                                    }),
                                )
                            
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 245, 245, 245),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                          Column(
                          children: [
                              BillDetailswidget(
                          detail: "Item total",
                          amount: state.carttotal.toString()
                        ),
                        SizedBox(height: 15),
                        BillDetailswidget(
                            detail: "packaging charges", amount: "10"),
                        SizedBox(height: 15),
                        BillDetailswidget(
                          detail: "delivery charges",
                          amount: "30",
                        ),
                        SizedBox(height: 50),
                        BillDetailswidget(
                          detail: "Total Amount",
                          amount: "${state.carttotal+packagingcharge+deliveycharge}",
                        ),
                          ],
                        )
                      
                      ],
                    ),
                  ),
                );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
           
          }
        ));
  }
}
