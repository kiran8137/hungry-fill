
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String? cartid = 'cartid1234';
const int packagingcharge = 10;
const int deliveycharge = 30;


class CartTotals {

 static Future<void> carttotal ({required List<String> dishids}) async{
   
   var totalsum = 0;
    final cartdoc = await FirebaseFirestore.instance
    .collection('Users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .collection('Cart')
    .doc(cartid)
    .get();

    print(cartdoc.data());

    for(var i = 0;i<cartdoc.data()!.length;i++){
      var ans = 0;
      
      // for(var i in cartdoc[i]){
      //   i.
      // }

    }
  }
}