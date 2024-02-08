import 'package:flutter/material.dart';
import 'package:foody/features/Auth/presentaion/views/login_view.dart';
import 'package:foody/features/Auth/presentaion/views/sign_up_view.dart';
import 'package:foody/features/home/presentaion/views/cart_view.dart';
import 'package:foody/features/home/presentaion/views/home_view.dart';
import 'package:foody/features/intro/presentation/views/on_boarding_view.dart';
import 'package:foody/features/splash/presentation/views/splash_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashView.id: (context) => const SplashView(),
  OnBoardingView.id: (context) => const OnBoardingView(),
  LoginView.id: (context) => const LoginView(),
  SignUpView.id: (context) => const SignUpView(),
  HomeView.id: (context) => const HomeView(),
  CartView.id:(context) => const CartView()
};
