import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: MyColors.primaryColor,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: MyColors.primaryColor,
  );
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.primaryColor,
  );
}
