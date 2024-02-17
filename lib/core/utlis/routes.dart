import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/Auth/presentaion/views/login_view.dart';
import 'package:foody/features/Auth/presentaion/views/sign_up_view.dart';

import 'package:foody/features/intro/presentation/views/on_boarding_view.dart';
import 'package:foody/features/layout/cart/presentaion/views/cart_view.dart';
import 'package:foody/features/layout/favourite/presentaion/views/favourite_view.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';
import 'package:foody/features/layout/home/presentaion/view_model/search_cubit/search_cubit.dart';
import 'package:foody/features/layout/home/presentaion/views/all_products_view.dart';
import 'package:foody/features/layout/home/presentaion/views/details_view.dart';
import 'package:foody/features/layout/home/presentaion/views/home_view.dart';
import 'package:foody/features/splash/presentation/views/splash_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashView.id: (context) => const SplashView(),
  OnBoardingView.id: (context) => const OnBoardingView(),
  LoginView.id: (context) => const LoginView(),
  SignUpView.id: (context) => const SignUpView(),
  HomeView.id: (context) => BlocProvider(
        create: (context) => SearchCubit(),
        child: const HomeView(),
      ),
  CartView.id: (context) => const CartView(),
  FavouriteView.id: (context) => const FavouriteView(),
  DetailsView.id: (context) => DetailsView(
        foodModel: ModalRoute.of(context)!.settings.arguments as FoodModel,
      ),
  AllRecipesView.id: (context) => const AllRecipesView()
};
