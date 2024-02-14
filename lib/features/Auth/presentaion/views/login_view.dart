import 'package:flutter/material.dart';
import 'package:foody/features/Auth/presentaion/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String id = '/LoginView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
