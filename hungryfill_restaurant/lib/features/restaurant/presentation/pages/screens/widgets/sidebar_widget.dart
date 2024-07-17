import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/sidebar_item_widget.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {

  int selectedindex = 0;

  List<String> sidebaritems = [
    "Dashboard",
    "Daily Orders",
    "Dishes"
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70 , horizontal: 20),
        child: ListView.builder(
          itemCount: sidebaritems.length,
          itemBuilder:(context , index)=> Padding(
            padding: const EdgeInsets.all(5.0),
            child: SideBarItem( 
              sidebaritem: sidebaritems,
              index: index, 
              selectedindex: selectedindex,
              itemselected : (int index){
                setState(() {
                  selectedindex = index;
                });
              }
              ),
          )
          ),
      )
        ,
    );
  }
}