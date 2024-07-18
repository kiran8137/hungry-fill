import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/data/repository/auth_repo_impl/authentication_repo.dart';
import 'package:hungry_fill/data/repository/restaurant_repo_impl/restaurant_repo_imp.dart';
import 'package:hungry_fill/data/repository/user_repo_impl/user_repo.dart';
import 'package:hungry_fill/firebase_options.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/login_bloc/log_in_bloc_bloc.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/splashscreen/splash_screen.dart';
import 'package:hungry_fill/presentation/pages/user_auth/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=> AuthBloc(AuthenticationRepoImplement(firebaseauth: FirebaseAuth.instance ,firestore: FirebaseFirestore.instance ))
          ),
        BlocProvider(
          create:(context)=> UsersBloc(userrepository: UserRepoImplementation(firestore: FirebaseFirestore.instance , firebaseauth : FirebaseAuth.instance), firebaseauth: FirebaseAuth.instance)
          ),

        BlocProvider(
          create:(context)=> RestaurantBloc(restaurantrepository: RestaurantRepoImp())
          ),
        
         BlocProvider(
          create:(context)=> LogInBloc(AuthenticationRepoImplement(firebaseauth: FirebaseAuth.instance ,firestore: FirebaseFirestore.instance ))
          )
        

         
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
           
        ),
        home: 
        const SplashScreen()
        //MainPage()
        // LogInScreen(),
        //OtpScreen()
        //UserProfileScreen()
        //SignInScreen()
      ),
    );
  }
}

 

