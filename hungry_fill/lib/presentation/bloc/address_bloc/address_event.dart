part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}




class GetAddressEvent extends AddressEvent{
  final Position position;

 const GetAddressEvent({required this.position});

 @override
  // TODO: implement props
  List<Object> get props => [position];
}


class SaveAddressToDb extends AddressEvent{
  final AddressModel useraddress;
  const SaveAddressToDb({required this.useraddress});

  @override
   
  List<Object> get props => [useraddress];
}

class GetAddressFromDb extends AddressEvent{
}