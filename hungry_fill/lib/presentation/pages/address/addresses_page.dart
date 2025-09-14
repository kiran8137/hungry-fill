import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/pages/address/widgets/address_detail_widget.dart';
import 'package:hungry_fill/presentation/pages/map/map_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

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
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: SizedBox(
      //   width: 330,
      //   height: 40,
      //   child: FloatingActionButton.extended(
      //     backgroundColor: AppColors.primaryColor,
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //     onPressed: () async {
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=> const MapScreen()));
      //       // final result =  await getAddressesFromDb();
      //       //debugPrint(result.toString());
      //     },
      //     label: Row(
      //       children: [
      //         const Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //         Text(
      //           'Add Address',
      //           style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(
                  text: 'My Address',
                  fontSize: 17.sp,
                  color: Color.fromRGBO(24, 528, 46, 1),
                ),
        
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
          child: Column(
             
            children: [
              Expanded(
                child: SizedBox(
                        //height: double.infinity,
                        child: BlocConsumer<AddressBloc, AddressState>(
                listener: (context, state) {
                  if(state is RemoveAddressSuccessState){
                    context.read<AddressBloc>().add(GetAddressFromDb());
                  }
                  if(state is RemoveAddressErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(scaffoldMessenger(message: "Can't able to remvoe , please try again" , color: Colors.red)
                    );
                  }
                },
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
                          child: AddressWidget(address: address),
                        );
                      });
                  }else{
                    return const SizedBox();
                  }
                   
                },
                        ),
                      ),
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const MapScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.primaryColor),
                                    height: 62.h,
                                    width:  double.infinity,
                                    child: Center(
                                      child: CustomText(
                                        text: 'Add New Address',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ),
                ),
              ),
                    
            ],
          )),
    );
  }

  
}

