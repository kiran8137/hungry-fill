part of 'address_bloc.dart';

sealed class AddressState extends Equatable {
  const AddressState();
  
  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class GetAddressSuccessState extends AddressState{
  final Placemark? address;
  const GetAddressSuccessState({required this.address});
  @override
   
  List<Object> get props => [address!];
}


final class GetAddressErrorstate extends AddressState{}


final class SaveAddressToDbSuccessState extends AddressState{}

final class SaveAddressToDbErrorState extends AddressState{}

final class GetAddressFromDbIntial extends AddressState{}

final class GetAddressFromDbSuccessState extends AddressState{

   final List<AddressModel> addresses;
  const GetAddressFromDbSuccessState({required this.addresses});

  @override
  // TODO: implement props
  List<Object> get props => [addresses];
}


final class GetAddressFromDbEmptyState extends AddressState{}

final class GetAddressFromDbErrorState extends AddressState{}

