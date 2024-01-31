import 'package:flutter/material.dart';
import 'package:foody/features/Auth/presentaion/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const String id = '/SignUpView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}
