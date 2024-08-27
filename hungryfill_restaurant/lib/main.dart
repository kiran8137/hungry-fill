import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/authrepo_implement/auth_repo_impl.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/dishrepo_implement/dish_repo_impl.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/resUser_implement/res_user_impl.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dish_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/res_detail_add_screen/res_detail_add.dart';
 
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/splash_screen/splash_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/restaurant_user/restaurant_user_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dish_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCx8eyONUEdYplhhkWNzrtROKi25-5eDDo",
          appId: "1:1043826955704:web:f79b48aec9358c4b6c6b4d",
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=> AuthBloc(AuthRepoImplementation() , ResUserImplementation())
          ),
          BlocProvider(
          create:(context)=> RestaurantUserBloc(restaurantuserrepository: ResUserImplementation())
          ),
          BlocProvider(
          create:(context)=> DishBloc(dishrepository: DishRepoImplementation())
          ),

          BlocProvider(
            create: (context) => CategoryBloc(dishrepository: DishRepoImplementation())
            )


      ],
       
      child: ChangeNotifierProvider(
        create: (context) => DishProvider(dishrepository: DishRepoImplementation()),

        child:     MaterialApp(
            debugShowCheckedModeBanner: false, 
            home:
            //ResDetailAddScreen()
            SplashScreen()
            //AddDish()
           // DishScreen()
            //ResetPasswordScreen()
           
            //SignInScreen()
             //LoginScreen()
           // MainScreen()
            //DishAddDialog()
            //ResDetailAddScreen()
            //ProfileScreen()
            ),
      ),
    );
  }
}
