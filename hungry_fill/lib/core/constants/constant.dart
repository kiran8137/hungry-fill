
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 

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

    debugPrint('dishids $dishids');

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
    debugPrint(dishprices.toString());

    var totalsum = 0;
    if(dishprices.length == 1){
      return dishprices.first;
    }else{
      totalsum = dishprices.reduce((value, element) => value += element);
       debugPrint(totalsum.toString());
    return totalsum;
    }

    

   
    
  } else {
    debugPrint('doc not exists');
  }
  }catch(error){
    log(error.toString());
    throw Exception(error.toString());
  }

}


// int cartCalculations({required int quantity , required int price }){
//   var answer = price*quantity;
//   debugPrint(answer.toString());
//   return answer;
//}


// Future<int> getcarttotal ({required String? userid , required String? restaurantid}) async{

//   int cartotal = 0;
//    final cartdoc = await FirebaseFirestore.instance
 
//       .collection('Cart')
//       .where('userId' , isEqualTo: userid )
//       .where('restaurantId' , isEqualTo: restaurantid)   
//       .get();

//       List<CartModel> cart = cartdoc.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
//       debugPrint(" items in cart${cart.toString()}");

//       for(var i in cart){
//          cartotal = cartotal+i.priceperquantity!;
//       }
//       debugPrint(cartotal.toString());
//       return cartotal;

// }



const aboutus = "At Hungry Fill, we believe food should be accessible, convenient, and delicious" 
"Whether you're craving a hearty meal or a light snack,"
 "our app connects you with the best restaurants and dishes in your area."
 "With a user-friendly interface and real-time updates, we make it easy to browse menus,"
  "place orders, and track your food from the kitchen to your doorstepOur mission is simple: to satisfy your hunger with speed and quality. We work closely with local restaurants to ensure every meal delivered is fresh, tasty, and prepared with care.";

const privacyAndPolicy =[ "1. Introduction",

"At Hungry Fill, we are committed to protecting the privacy of our users. This Privacy Policy outlines the types of personal information we collect, how we use it, and the steps we take to ensure your data remains secure. By using our app, you agree to the collection and use of information in accordance with this policy.",

"2. Information We Collect",

"We collect the following information when you use our app:",

"Personal Information: This includes your name, email address, phone number, and delivery address. We collect this data to provide you with our services, including delivery and customer support."
"Authentication Information: We use Firebase for email authentication. Your email is used as a unique identifier for account creation and login purposes."
"Location Data: We may collect your location information (if permitted by you) to provide you with location-based services, such as finding nearby restaurants and delivering orders to your address.",


"3. How We Use Your Information",

"We use the information we collect for the following purposes:",

"To create and manage your account."
"To deliver food orders to your address."
"To communicate with you regarding your orders, updates, and customer support."
"To improve our app functionality and user experience."
"To personalize your experience by showing restaurants and offers based on your location.",


"4. Sharing Your Information",

"We do not share your personal information with third parties, except in the following cases:"

"Service Providers: We may share your information with service providers (e.g., delivery partners) who perform services on our behalf."
"Legal Requirements: If required by law, we may disclose your information to authorities.",


"5. Security of Your Data",

"We take the security of your personal data seriously. We use industry-standard encryption methods and follow best practices to protect your data against unauthorized access or disclosure. Firebase provides robust security features to safeguard your information.",

"6. Data Retention",

"We retain your personal data for as long as necessary to provide our services or as required by law. You may request deletion of your data by contacting us at [Insert Contact Email].",

"7. Your Rights",

"You have the right to:",

"Access the personal data we hold about you."
"Request corrections to any inaccuracies in your data."
"Request deletion of your data."
"Withdraw consent for data collection at any time (though this may affect your ability to use certain features of the app).",


"8. Changes to This Privacy Policy",

"We may update this Privacy Policy from time to time. Any changes will be posted on this page with the revised date. You are advised to review this page periodically for any updates.",

"9. Contact Us",

"If you have any questions or concerns about this Privacy Policy or your personal data, please contact us at:",
 ];