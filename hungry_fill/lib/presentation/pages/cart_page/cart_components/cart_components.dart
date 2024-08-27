import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/repository/cart_repo_imp/cart_repo_impl.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';

SingleChildScrollView cartDishDetail(AsyncSnapshot<List<CartModel>> snapshot) {
  return SingleChildScrollView(
    child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final cartdish = snapshot.data![index];
          return Dismissible(
            direction: DismissDirection.horizontal,
            key: Key(cartdish.cartid!),
            onDismissed: (direction) {
              deleteDishInCart(cartid: cartdish.cartid!);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(155, 248, 248, 248),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              cartdish.dishimage!,
                            ),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          cartdish.dishname!,
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "₹ ${cartdish.priceperquantity.toString()}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primarycolor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (cartdish.dishquantity! > 1) {
                              await decrease(
                                  dishquantity: cartdish.dishquantity!,
                                  cartid: cartdish.cartid!);
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                            color: primarycolor,
                          ),
                        ),
                        Text(
                          cartdish.dishquantity.toString(),
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () async {
                            debugPrint('clicked on ${cartdish.dishname}');
                            await increase(
                                dishquantity: cartdish.dishquantity!,
                                cartid: cartdish.cartid!);
                          },
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

AppBar appBar(BuildContext context, String restaurantname) {
  return AppBar(
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          BlocProvider.of<DishBloc>(context).add(GetRestaurantsInCart());
        },
        child: const Icon(Icons.arrow_back_ios_new)),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(4),
      child: Container(
        color: const Color.fromARGB(255, 188, 188, 188),
        height: 1,
      ),
    ),
    title: Column(
      children: [
        Text(
          'Your Cart',
          style: GoogleFonts.abhayaLibre(),
        ),
        Text(
          restaurantname,
          style: GoogleFonts.acme(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    ),
    centerTitle: true,
  );
}

Container cartFloatingActionButton() {
  return Container(
    width: 250,
    height: 60,
    decoration: BoxDecoration(
        color: primarycolor, borderRadius: BorderRadius.circular(25)),
    child: Center(
      child: Text(
        "Procced to Check out",
        style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

Column billDetails(AsyncSnapshot<int> snapshot) {
  return Column(
    children: [
      BillDetailswidget(detail: "Item total", amount: "${snapshot.data}"),
      const SizedBox(height: 15),
      const BillDetailswidget(detail: "packaging charges", amount: "10"),
      const SizedBox(height: 15),
      const BillDetailswidget(
        detail: "delivery charges",
        amount: "30",
      ),
      const SizedBox(height: 50),
      BillDetailswidget(
        detail: "Total Amount",
        amount: "${snapshot.data! + packagingcharge + deliveycharge}",
      ),
    ],
  );
}
