import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/dashboard_screen/responsive/responsive_widgets.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/dashboard_screen/widgets/revenue_cart_widget.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, this.index});

  final int? index;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? url;

  @override
  void didChangeDependencies() {
    Provider.of<DashboardProvider>(context).getUsersCount();
    Provider.of<DashboardProvider>(context).getOrdersCount();
    Provider.of<DashboardProvider>(context).getRestaurantCount();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => 
         constraints.maxWidth>600 ? 
         const WebView():
        const MobileView()
      ),
    );
  }
}


