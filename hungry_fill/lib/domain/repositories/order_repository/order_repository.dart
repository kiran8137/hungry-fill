
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';

abstract class OrderRepository{


Future<Placemark> getAddress({required Position positon});

Future<void>  saveAddressToDB({required AddressModel useraddress});

Future<List<AddressModel>> getAddressesFromDb();

}
