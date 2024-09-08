
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 150,
                child: Text(
                  '${address.street}',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )),
            SizedBox(
                width: 220,
                child: Text(
                  '${address.houseNo}, ${address.district}, ${address.state}',
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
                  'Phone No : ${address.userMobileNumber}',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                )),
    
            const SizedBox(
              height: 15,
            ),
    
            Row(
              children: [
                Text(
                  'EDIT',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primarycolor),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context, 
                      builder: (context){
                        return   AlertDialog(
                          title: const Text('Are you sure want to delete'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                debugPrint('cancel');
                                Navigator.pop(context);
                              },
                               child: const Text('cancel')
                               ),
    
                                TextButton(
                              onPressed: (){
                                debugPrint('ok');
                                BlocProvider.of<AddressBloc>(context).add(RemoveAddress(addressid: address.addressid!));
                                Navigator.pop(context);
                              },
                               child:const Text('ok')
                               ),
                            
                          ],
                        );
                      }
                    );
                  },
                  child: Text(
                    'DELETE',
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
