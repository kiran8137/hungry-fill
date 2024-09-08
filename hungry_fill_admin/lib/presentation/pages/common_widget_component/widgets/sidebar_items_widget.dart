
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
 

class SideBarItem extends StatefulWidget {
    SideBarItem({super.key,   required this.index, required this.sidebaritem, required this.selectedindex, required this.itemselected });

  final List<String> sidebaritem;
  final int index;
  int selectedindex;
  final ValueChanged<int> itemselected;

  @override
  State<SideBarItem> createState() => _SideBarItemState();
}

class _SideBarItemState extends State<SideBarItem> {
  int? selectedindex;
  @override
  Widget build(BuildContext context) {
    final isselected = widget.selectedindex == widget.index;
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
         
        onTap: (){
           widget.itemselected(widget.index);
        },
        child: Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isselected ? 
            Color.fromARGB(188, 8, 5, 26).withOpacity(0.15): Colors.white
        
          ),
          child: Center(child: Text(widget.sidebaritem[widget.index],
          style: GoogleFonts.inriaSans(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isselected ? primarycolor : Colors.black
          ),
          )),
        ),
      ),
    );
  }
}