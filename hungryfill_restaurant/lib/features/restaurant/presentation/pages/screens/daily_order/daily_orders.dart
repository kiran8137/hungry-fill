import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_orders_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/orders_bloc/orders_bloc.dart';

class DailyOrders extends StatelessWidget {
  DailyOrders({super.key, this.index});

  final int? index;

  final tablecontents = ["", "Date", "Customer Name", "Total", "Order Status"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Daily Orders',
            style: GoogleFonts.radioCanada(
                fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: dailyOrdersBar(),
          ),
          const SizedBox(height: 5),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 15),
                              child: Container(
                                //  color: Colors.amber,
                                height: 30,
                                width: double.infinity,
                                child: dishDetailTable(tablecontents),
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                                height: 450,
                                width: double.infinity,
                                child: BlocBuilder<OrdersBloc, OrdersState>(
                                  builder: (context, state) {
                                    if(state is GetOrderListIntial){
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    if(state is GetOrdersListEmpty){
                                      return Center(child: Text("No orders placed"));
                                    }
                                    if(state is GetOrdersListError){
                                      return Center(child: Text('Something went wrong..!We are working on it..!'),);
                                    }

                                    if(state is GetOrderListSuccess){
                                       return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final order = state.orderList[index];
                                          return DailyOrdersWidget(order: order,);
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount: state.orderList.length);
                                    }else{
                                      return Center(child: Text('Something went wrong..!We are working on it..!'));
                                    }
                                   
                                  },
                                )),
                          ]))))
        ]));
  }
}
