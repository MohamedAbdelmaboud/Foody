import 'package:flutter/material.dart';
import 'package:foody/core/themes/light_theme.dart';
import 'package:foody/core/utlis/routes.dart';
import 'package:foody/features/home/presentaion/views/cart_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: CartView.id,
      routes: routes,
    );
  }
}
