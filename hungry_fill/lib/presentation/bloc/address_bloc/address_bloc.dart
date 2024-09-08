import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/repository/order_repo_impl/order_repo_imp.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  OrderRepoImp orderrepository;
  AddressBloc({required this.orderrepository}) : super(AddressInitial()) {
    
    on<GetAddressEvent>(getAddress);
    on<SaveAddressToDb>(saveAddressToDb);
    on<GetAddressFromDb>(getAddressFromDb);
    on<RemoveAddress>(removeAddress);
    on<GetAddressUsingId>(getAddressUsingId);
  }

  FutureOr<void> getAddress(GetAddressEvent event, Emitter<AddressState> emit) async{
   emit(AddressInitial());
    try{
      final placemarkaddress = await orderrepository.getAddress(positon:  event.position);
       
      emit(GetAddressSuccessState(address: placemarkaddress));
    }catch(error){
      emit(GetAddressErrorstate());
      log(error.toString());
    }
  }

  FutureOr<void> saveAddressToDb(SaveAddressToDb event, Emitter<AddressState> emit) async{
    try{
      await orderrepository.saveAddressToDB(useraddress: event.useraddress);
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getAddressFromDb(GetAddressFromDb event, Emitter<AddressState> emit) async{
    emit(GetAddressFromDbIntial());
    try{
      final result = await orderrepository.getAddressesFromDb();
      if(result.isNotEmpty){
        emit(GetAddressFromDbSuccessState(addresses: result));
      }
      if(result.isEmpty){
        emit(GetAddressFromDbEmptyState());
      }
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> removeAddress(RemoveAddress event, Emitter<AddressState> emit) async {

    try{

      await orderrepository.removeAddress(addressid: event.addressid);
      emit(RemoveAddressSuccessState());

    }catch(error){
      emit(RemoveAddressErrorState());
      log(error.toString());
    }
  }

  FutureOr<void> getAddressUsingId(GetAddressUsingId event, Emitter<AddressState> emit) async{
    try{
      final address =await orderrepository.getAddressUsingId(addressid: event.addressid);
      emit(GetAddressUsingIdSuccess(address: address));
    }catch(error){
      log((error.toString()));
    }
  }
}
