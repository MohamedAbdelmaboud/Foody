import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/themes/light_theme.dart';
import 'package:foody/core/utlis/firebase_options.dart';
import 'package:foody/core/utlis/routes.dart';
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
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: routes,
    );
  }
}
