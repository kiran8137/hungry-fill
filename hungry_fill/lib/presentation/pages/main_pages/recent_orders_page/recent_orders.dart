import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/components/components_recentorders.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/recent_orders_detail.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/widgets/orders_list_widget.dart';

class RecentOrderScreen extends StatefulWidget {
  const RecentOrderScreen({super.key});

  @override
  State<RecentOrderScreen> createState() => _RecentOrderScreenState();
}

class _RecentOrderScreenState extends State<RecentOrderScreen> {
  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(GetOrderDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text('Orders'),
            const Divider(),
            const SizedBox(height: 10),
            BlocConsumer<OrderBloc, OrderState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetOrderDetailsInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetOrderDetailsEmpty) {
                  return const Text("No Orders Placed");
                }

                if (state is GetOrderDetailsSuccess) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final order = state.orderslist[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RecentOrdersDetailScreen(
                                          orderdetail: order,
                                        )));
                          },
                          child: OrdersListWidget(
                            order: order,
                            index: index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.orderslist.length,
                    ),
                  );
                } else {
                  return const Center(child: Text('some thing went wrong'));
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
