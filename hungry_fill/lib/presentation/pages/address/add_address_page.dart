import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage(
      {super.key, required this.address, required this.positon});

  final Placemark address;
  final Position positon;

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final formkey = GlobalKey<FormState>();
  UserModel? currentuserdetail;
  late TextEditingController recipientnamecontroller;
  late TextEditingController recipientnumbercontroller;

  TextEditingController flatnumbercontroller = TextEditingController();
  late TextEditingController addresscontroller;

  @override
  void initState() {
    getUserdetail();
    recipientnamecontroller =
        TextEditingController(text: currentuserdetail?.username);
    recipientnumbercontroller =
        TextEditingController(text: currentuserdetail?.usermobilenumber);
    addresscontroller = TextEditingController(
        text: "${widget.address.subLocality}, ${widget.address.locality}");
    super.initState();
  }

  Future<void> getUserdetail() async {
    currentuserdetail = await getUserDetailForAddress();
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
               AddressModel useraddress = AddressModel(
                              latitude: widget.positon.latitude.toString(),
                              longitude: widget.positon.longitude.toString(),
                              userid: FirebaseAuth.instance.currentUser?.uid,
                              username: recipientnamecontroller.text,
                              userMobileNumber: recipientnumbercontroller.text,
                              houseNo: flatnumbercontroller.text,
                              street: widget.address.subLocality,
                              district: widget.address.locality,
                              state: widget.address.administrativeArea);

                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AddressBloc>(context)
                                .add(SaveAddressToDb(useraddress: useraddress));
                                Navigator.pop(context);
                          }
          },
          label: 
             
              Text(
                'Save Address',
                style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
              ),
            
          
        ),
      ),
      resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.white,
          title: Text('Add Address', style: GoogleFonts.abhayaLibre()),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //const SizedBox(height: 10),
                        TextFormWidget(
                          controller: recipientnamecontroller,
                          hinttext: 'Recipient Name',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return "fields should not be empty or must be 3 characters";
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormWidget(
                          controller: recipientnumbercontroller,
                          hinttext: 'Recipient Number',
                          validator: (value) {
                            final regex = RegExp(r'^[0-9]{10}$');
                            if (!regex.hasMatch(value!)) {
                              return "Enter a valid phone number";
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormWidget(
                          controller: flatnumbercontroller,
                          hinttext: 'Flat / House No / Building',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 2) {
                              return "fields should not be empty or must be 2 characters";
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormWidget(
                          controller: addresscontroller,
                          hinttext: 'Area / Locality',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return "Please enter a valid address ";
                            }
                          },
                        ),
                        
                      ],
                    ),
                  ),
                ))));
  }
}
