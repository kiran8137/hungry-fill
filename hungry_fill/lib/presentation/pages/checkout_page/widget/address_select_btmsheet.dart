import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({super.key});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  @override
  void initState() {
    BlocProvider.of<AddressBloc>(context).add(GetAddressFromDb());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
             
          }
          ,
          child: const Icon(Icons.back_hand)),
      ),
        backgroundColor: Colors.white,
        body: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if(state is GetAddressFromDbIntial){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is GetAddressFromDbSuccessState){
               return SafeArea(
                child: Column(
              children: [
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
                      "Addresses",
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                        child: Divider(
                      color: Colors.grey,
                    ))
                  ],
                ),
                SizedBox(
                  height: 340,
                 // color: Colors.green,
                  width: double.infinity,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final address = state.addresses[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.pop(context,address.addressid);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5, top: 8),
                            child: Container(
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
                                          '${address.street}',
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        )),
                                    SizedBox(
                                        width: 150,
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
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: state.addresses.length
                      ),
                )
              ],
            )
            );
            }else{
              return const SizedBox();
            }
           
          },
        ));
  }
}
