
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/components/components.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarSettingsContents(context , 'Privacy and Policy'),

      body: LayoutBuilder(
        builder: (context, constraints) => 
          SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SingleChildScrollView(
                 child: SizedBox(
                  //color: Colors.red,
                  width: double.infinity,
                  height: constraints.maxHeight<700 ? 660 : 760,
                   
                  child: ListView.builder(
                    itemCount: privacyAndPolicy.length,
                    itemBuilder:(context, index) => 
                      settingPageContent(content: privacyAndPolicy[index])
                    ),
                             ),
               ),
            ],
          )
          ),
      ),
    );
  }
}