import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/themes/light_theme.dart';
import 'package:foody/core/utlis/api_service.dart';
import 'package:foody/core/utlis/firebase_options.dart';
import 'package:foody/core/utlis/routes.dart';
import 'package:foody/features/Auth/presentaion/view_models/cubit/auth_cubit.dart';
import 'package:foody/features/home/data/repos/home_repo_implmentaion.dart';
import 'package:foody/features/home/presentaion/view_model/cart_cubit/cart_cubit.dart';
import 'package:foody/features/home/presentaion/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:foody/features/home/presentaion/view_model/food_cubit/food_cubit.dart';
import 'package:foody/features/splash/presentation/views/splash_view.dart';

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
          create: (context) => CartCubit(),
        ),
        BlocProvider(
        create: (context) => FavouriteCubit()),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FoodCubit(
            HomeRepoImplmentaion(
              apiService: ApiService(dio: Dio()),
            ),
          )..fetchFoodItems(),
        )
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.id,
        routes: routes,
      ),
    );
  }
}
