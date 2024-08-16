import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/repository/auth_repo/auth_repo_impl.dart';
import 'package:hungry_fill_admin/data/repository/restaurant_repo/restaurant_repo_impl.dart';
import 'package:hungry_fill_admin/presentation/pages/auth_screens/sign_in.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/main_screen.dart';
import 'package:hungry_fill_admin/presentation/pages/splash_screen/splash_screen.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/auth_provider.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCx8eyONUEdYplhhkWNzrtROKi25-5eDDo",
          appId: "1:1043826955704:web:fe0880b87af944026c6b4d",
          messagingSenderId: "1043826955704",
          projectId: "hungry-fill",
          storageBucket: "hungry-fill.appspot.com"
          ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:  (context) => RestaurantProvider(restaurantrepository: RestaurantRepoImpl()),
          ),
        ChangeNotifierProvider(
          create: (context)=> AuthProvider(authrepository: AuthRepoImpl())
          )
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        
        home:  SplashScreen()
        //LoginScreen() 
       // MainScreen(),
      ),
    );
  }
}

 