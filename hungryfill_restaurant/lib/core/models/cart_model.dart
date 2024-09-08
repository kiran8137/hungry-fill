class CartModel{

final String? cartid;
final String? userid;
final String? restaurantid;
final String? dishid;
final int? dishquantity;
final int? priceperquantity;
final String? dishname;
final String? dishimage;


 const CartModel({this.cartid, this.userid, this.restaurantid, this.dishid, this.dishquantity, this.priceperquantity , this.dishname , this.dishimage});


factory CartModel.fromJson({required Map<String , dynamic> json}){
    return CartModel(
      cartid : json['cartId'],
      userid: json['userId'],
      dishid: json['dishId'],
      restaurantid: json['restaurantId'], 
      dishquantity: json['dishQuantity'],
      priceperquantity: json['priceperQuantity'],
      dishname: json['dishName'],
      dishimage: json['dishImage']
      );
  }
  

  
}