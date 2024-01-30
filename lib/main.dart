import 'package:flutter/material.dart';
import 'package:foody/features/Auth/presentaion/views/login_view.dart';
import 'package:foody/features/intro/presentation/views/on_boarding_view.dart';
import 'package:foody/features/splash/presentation/views/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => const SplashView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        LoginView.id: (context) => const LoginView()
      },
    );
  }
}
