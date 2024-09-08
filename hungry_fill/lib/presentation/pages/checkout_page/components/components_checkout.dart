

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'dart:math' as math;


//address in checkoutpage
Column addressDetailCheckOut(GetAddressUsingIdSuccess state) {
    return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      state.address.street!,
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    )),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      '${state.address.houseNo}, ${state.address.district}, ${state.address.state}',
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                              255, 139, 138, 138)),
                                    )),
                                //const SizedBox(height: 5),
                                SizedBox(
                                    width: 200,
                                    child: Text(
                                      'Phone No : ${state.address.userMobileNumber}',
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    )),

                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
  }

//select address container 
  Container selectAddressContainer() {
    return Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),
                      child: const Center(
                        child: Text(
                          'Select Addreesss',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
  }



  //dish widget in check out page
  Container dishWidgetInCheckOut(CartModel cartdish) {
    return Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                      155, 248, 248, 248),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              cartdish.dishimage!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 90,
                                        child: Text(
                                          // cartdish.dishname!,
                                          '${cartdish.dishname}',
                                          maxLines: 2,
                                          style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        //"₹ ${cartdish.priceperquantity.toString()}",
                                        "₹ ${cartdish.priceperquantity.toString()}",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cartdish.dishquantity.toString(),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
  }


 Container payUsingOptions({required String paymentoption , required bool isCod}) {
    return Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: isCod
                                  ? primarycolor
                                  : const Color.fromARGB(
                                      255, 166, 165, 165))),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(paymentoption,
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    );
  }




  
//total price  in appbar
Row totalBillInAppBar({required String text , required String carttotalprice}) {
    return Row(
        children: [
          Text('$text :', style: GoogleFonts.abhayaLibre()),
          Text(
            '₹ $carttotalprice',
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      );
  }
  

 Container conformPaymentButton({required String text}) {
    return Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(text,
                                  style: GoogleFonts.breeSerif(
                                      color: Colors.white, fontSize: 18)),
                            ),
                          );
  }
  
