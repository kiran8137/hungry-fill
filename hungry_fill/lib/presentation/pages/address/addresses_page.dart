import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/repository/order_repo_impl/order_repo_imp.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/pages/map/map_screen.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  @override
  void initState() {
     BlocProvider.of<AddressBloc>(context).add(GetAddressFromDb());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 330,
        height: 40,
        child: FloatingActionButton.extended(
          backgroundColor: primarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MapScreen()));
            // final result =  await getAddressesFromDb();
            //debugPrint(result.toString());
          },
          label: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                'Add Address',
                style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Addresses',
          style: GoogleFonts.abhayaLibre(),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {

            if(state is GetAddressFromDbIntial){
              return const Center(child: CircularProgressIndicator());
            }
            if(state is GetAddressFromDbEmptyState){
              return const Center(child: Text('No Address Added'),);
            }
            if(state is GetAddressFromDbSuccessState){
              
              return  ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  final address = state.addresses[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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

                            Row(
                              children: [
                                Text(
                                  'EDIT',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: primarycolor),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'DELETE',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
            }else{
              return SizedBox();
            }
             
          },
        ),
      )),
    );
  }
}
