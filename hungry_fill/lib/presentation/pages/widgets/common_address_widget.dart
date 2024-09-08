import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';

class CommonAddressWidget extends StatelessWidget {
  const CommonAddressWidget({
    super.key, required this.addressSelected,
    // required this.orderdetail,

  });

  //final OrderModel orderdetail;
  final AddressModel addressSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 150,
                child: Text(
                  '${addressSelected.street}',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )),
            SizedBox(
                width: 150,
                child: Text(
                  '${ addressSelected.houseNo}, ${addressSelected.district}, ${addressSelected.state}',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color:
                          const Color.fromARGB(255, 139, 138, 138)),
                )),
            //const SizedBox(height: 5),
            SizedBox(
                width: 200,
                child: Text(
                  'Phone No : ${addressSelected.userMobileNumber}',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400, fontSize: 15),
                )),
    
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}