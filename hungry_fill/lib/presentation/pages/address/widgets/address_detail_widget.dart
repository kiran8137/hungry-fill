import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(240, 245, 250, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            // BoxShadow(
            //     color: Colors.black.withOpacity(0.20),
            //     spreadRadius: 0,
            //     blurRadius: 7,
            //     offset: const Offset(0, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 150.w,
                    child: CustomText(
                     text: '${address.street}',
                     fontSize: 16.sp,
                     color: Color.fromRGBO(50, 52, 62, 1),
                    )),

                     GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Are you sure want to delete'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    debugPrint('cancel');
                                    Navigator.pop(context);
                                  },
                                  child: const Text('cancel')),
                              TextButton(
                                  onPressed: () {
                                    debugPrint('ok');
                                    BlocProvider.of<AddressBloc>(context).add(
                                        RemoveAddress(
                                            addressid: address.addressid!));
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ok')),
                            ],
                          );
                        });
                  },
                  child: Icon(Icons.delete_outline, color: AppColors.primaryColor,)
                )
              ],
            ),
            SizedBox(
                width: 220.w,
                child: CustomText(
                  fontSize: 14.sp,
                  text: '${address.houseNo}, ${address.district}, ${address.state}',
                  color: Color.fromRGBO(50, 52, 62, 1),
                )),
            //const SizedBox(height: 5),
            SizedBox(
                width: 200.w,
                child: CustomText(
                  text: 'Phone No : ${address.userMobileNumber}',
                  fontSize: 14.sp,
                   color: Color.fromRGBO(50, 52, 62, 1)
                )),

            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
