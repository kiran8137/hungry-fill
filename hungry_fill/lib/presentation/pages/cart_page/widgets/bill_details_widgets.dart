
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailswidget extends StatelessWidget {
  const BillDetailswidget({
    super.key, required this.detail, required this.amount,
  });

  final String detail;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(detail,
        style:   TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500
        ),
        ),
    
        Text("₹ $amount",
        style:   TextStyle(
          fontSize: 17.sp
          
        ),
        ),
    
    
      ],
    );
  }
}