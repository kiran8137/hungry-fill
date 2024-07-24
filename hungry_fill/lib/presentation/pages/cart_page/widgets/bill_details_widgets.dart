
import 'package:flutter/material.dart';

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
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500
        ),
        ),
    
        Text("₹ $amount",
        style: const TextStyle(
          fontSize: 17
          
        ),
        ),
    
    
      ],
    );
  }
}