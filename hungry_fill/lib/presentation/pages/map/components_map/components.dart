
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';

// Future<void> addAddressDetail(BuildContext ctx , BuildContext context){
//   return showModalBottomSheet(
//     isDismissible: false,
//     context: context, 
//     builder: (ctx)=> const AddAddressPage()
//     );
// }

Container addAddressDetailsButton({required String text}) {
    return Container(
                              margin: const EdgeInsets.only(top: 70),
                              width: 250,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  "Add Address Details",
                                  style: GoogleFonts.breeSerif(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ));
  }


//get current location button
Container getCurrentLocationButton({required String text}) {
    return Container(
                    height: 35,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Icon(
                          Icons.my_location,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        Text(
                          text,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                              fontSize: 15),
                        )
                      ],
                    ),
                  );
  }