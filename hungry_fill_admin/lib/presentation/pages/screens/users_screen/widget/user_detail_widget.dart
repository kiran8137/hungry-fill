
 
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/user_model.dart';

class UserDetailWidget extends StatelessWidget {
      UserDetailWidget({
    super.key, required this.user,required this.index
  });
 final UserModel user;
 int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child:   Row(
          children: [
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Text(
                "${index+1}",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 120),
            SizedBox(
              width: 150,
              child: Text("${user.username}",
              style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 50),
            SizedBox(
           
              width: 150,
              child: Text('${user.useremail}', style: const TextStyle(fontWeight: FontWeight.w600))),
            const SizedBox(width: 110),
            SizedBox(
            
              width: 85,
              child: Text('${user.usermobilenumber}', style: const TextStyle(fontWeight: FontWeight.w600))),
            const SizedBox(width: 250),
            SizedBox(
              width: 150,
              child: Text("${user.noOfOrders} / ${user.total}"),
            ),
          ],
        )
        );
  }
}
