import 'package:flutter/material.dart';
import 'package:foody/features/layout/home/presentaion/views/home_view.dart';

void navigateToHome(BuildContext context) {
  Navigator.popAndPushNamed(context, HomeView.id);
}
