import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';

class DishDetailWidgetMobile extends StatelessWidget {
  const DishDetailWidgetMobile({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black
                    .withOpacity(0.40),
                spreadRadius: -9,
                blurRadius: 9,
                offset: const Offset(5, 15))
          ]),
      height: 200,
      width: 50,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image:  NetworkImage(dish.image1!),fit: BoxFit.cover)
            ),
          ),
          orderDetailText(
              text: '${dish.dishname}'),
          orderDetailText(
              text: '₹ ${dish.dishprice}'),
          orderDetailText(
              text: '${dish.serve} serve'),
          orderDetailText(text: '${dish.stock}')
          //  Text('15/10/2002'),
          //  Text('₹ 250'),
          //  Text('delivered')
        ],
      ),
    );
  }
}
