import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/users_screen/widget/user_detail_widget.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final tablecontents = [
    "#",
    "Name",
    "Email",
    "Mobile Number",
    "No.of Orders / Total Rs",
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: appBarCommon(title: 'Users'),
      body: Column(children: [
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders List',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 34,
                          width: 250,
                          //color: Colors.red,
                          child: TextFormField(
                            controller: searchController,
                            style: const TextStyle(height: 1.3),
                            decoration: InputDecoration(
                                hintText: 'Search Order',
                                hintStyle: const TextStyle(fontSize: 11),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            onChanged: (String? query) {},
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            )),
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
                            child: SizedBox(
                              //  color: Colors.amber,
                              height: 30,
                              width: double.infinity,
                              child: restaurantDetailTable(tablecontents),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 450,
                            width: double.infinity,
                            child: Consumer<UserProvider>(
                              builder: (context, value, child) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final user = value.usersList[index];
                                      return UserDetailWidget(
                                        user: user,
                                        index: index,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: value.usersList.length);
                              },
                            ),
                          ),
                        ]))))
      ]),
    );
  }
}
