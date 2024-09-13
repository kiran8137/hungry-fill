
import 'package:flutter/material.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/components/components.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarAboutPage(context),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: aboutPageContent()
              ),
          ],
        )
        ),
    );
  }

  
 
}