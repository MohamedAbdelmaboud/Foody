import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody/features/intro/presentation/views/on_boarding_view.dart';
import 'package:foody/features/splash/presentation/widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  static const String id = '/'; // main or home rote
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
