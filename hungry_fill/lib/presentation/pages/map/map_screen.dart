import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/pages/address/add_address_page.dart';
import 'package:hungry_fill/presentation/pages/map/components_map/components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

late GoogleMapController googlemapcontroller;
Position? position; //include latitude and longitude
Placemark? address;
Set<Marker> markers = {};

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          backgroundColor: primarycolor,
          child: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  // color: Colors.red,
                  child:
                      //const Text("map")
                      GoogleMap(
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(11.006340, 76.962170), zoom: 12),
                    markers: markers,
                    onMapCreated: (controller) {
                      googlemapcontroller = controller;
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 500),
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: BlocConsumer<AddressBloc, AddressState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AddressInitial) {
                      return const Center(
                          child: Text('Select the place to get the order'));
                    }

                    if (state is GetAddressSuccessState) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.asset("assets/gps.png")),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      color: Colors.white,
                                      child: Text(
                                        //'Ram Nagar',
                                        '${state.address?.subLocality}',
                                        style: GoogleFonts.rubik(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      '${state.address?.locality}  ',
                                      style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // addAddressDetail(context, context);
                              showModalBottomSheet(
                                  isDismissible: false,
                                  context: context,
                                  builder: (ctx) => AddAddressPage(
                                        address: state.address!,
                                        positon: position!,
                                      ));
                            },
                            child: addAddressDetailsButton(
                                text: 'Add Address Details'),
                          )
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 220,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      position = await getCurrentLocation();

                      BlocProvider.of<AddressBloc>(context)
                          .add(GetAddressEvent(position: position!));

                      // address = await getAddress(position!);
                      googlemapcontroller.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(
                                  position!.latitude, position!.longitude),
                              zoom: 12)));

                      markers.clear();

                      markers.add(Marker(
                          markerId: const MarkerId('current location'),
                          position:
                              LatLng(position!.latitude, position!.longitude)));

                      setState(() {});
                    },
                    child: getCurrentLocationButton(text: 'Current Location'),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
