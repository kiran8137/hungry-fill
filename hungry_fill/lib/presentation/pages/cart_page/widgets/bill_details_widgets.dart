
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

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
        CustomText(
        text : detail,
        fontSize: 14.sp,
        color: Color.fromRGBO(160, 165, 186, 1)
        ),
    
        CustomText(
        text:  "₹ $amount",
        fontSize: 15.sp,
        color: Color.fromRGBO(24, 28, 46, 1),
        ),
    
    
      ],
    );
  }
}