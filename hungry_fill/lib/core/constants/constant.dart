
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 

const String cartid = 'cartid1234';
const int packagingcharge = 10;
const int deliveycharge = 30;

Future<int?> carttotal({required List<String> dishids , required String? restaurantid}) async {
   
  


  try{

    

    final cartsnapref = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('Cart')
      .doc(cartid);

  DocumentSnapshot<Map<String, dynamic>> cartsnapshot = await cartsnapref.get();
   



  if (cartsnapshot.exists) {
    List<dynamic> dishids = cartsnapshot.get('items');

    print('dishids $dishids');

    final dishdocref = FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(restaurantid)
        .collection('Dishes');

    final dishquerysnap = await dishdocref.where('dishId', whereIn: dishids).get();

    final result = dishquerysnap.docs.map((doc) => doc.data()).toList();

    List<int> dishprices = [];
    for (var i in result) {
      dishprices.add(int.parse(i['dishPrice']));
    }
    print(dishprices);

    var totalsum = 0;
    if(dishprices.length == 1){
      return dishprices.first;
    }else{
      totalsum = dishprices.reduce((value, element) => value += element);
       print(totalsum);
    return totalsum;
    }

    

   
    
  } else {
    print('doc not exists');
  }
  }catch(error){
    log(error.toString());
    throw Exception(error.toString());
  }

  
}
